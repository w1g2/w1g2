#!/bin/sh

FN=wg-cron.sh
FV=openwrt-v1.0

SN=/tmp/${0##*/}
SN=${SN%.*}

set_up () {
  local sh=$(readlink -f $0)
  local bin=${sh%/*}
  x=/etc/sysupgrade.conf
  if ! grep -qxF "$bin/" $x; then
    echo "$bin/" >>$x
  fi
  echo "--- $x ---"
  cat $x
  x=/etc/crontabs/root
  cp $x $SN.cron
  grep -vwF "$sh" $SN.cron >$x
  echo '*/5 10 * * *' "S=$sh;" \
    '$S; if [ -s $S.tmp ]; then cat $S.tmp >$S; rm -f $S.tmp; fi' >>$x
  /etc/init.d/cron restart
  echo "--- $x ---"
  cat $x
}
toggle_pause () {
  echo -n "pause"
  if [ -e $0.pause ]; then
    echo "|off"
    rm -f $0.pause
  else
    echo "|on"
    touch $0.pause
  fi
}
toggle_log () {
  echo -n "log"
  if [ -e $0.log ]; then
    echo "|off"
    rm -f $0.log
  else
    echo "|on"
    touch $0.log
  fi
}
toggle_renew () {
  echo -n "renew"
  if [ -e $0.renew ]; then
    echo "|off"
    rm -f $0.renew
  else
    echo "|on"
    touch $0.renew
  fi
}
wg_idle () {
  return $(uci get wireguard.@proxy[0].enable)
}
wg_on () {
  if wg_idle; then
    echo "WG|switch|on"
    uci set wireguard.@proxy[0].enable=1
    uci commit wireguard
    /etc/init.d/wireguard start 2>/dev/null
  fi
}
wg_off () {
  if ! wg_idle; then
    echo "WG|switch|off"
    uci set wireguard.@proxy[0].enable=0
    uci commit wireguard
    /etc/init.d/wireguard stop 2>/dev/null
  fi
}
set_ep () {
  local wgip=$(curl -skLm 9 "35.247.124.154/ip/w1g2.com")
  if echo $wgip |grep -qx "[1-9][0-9.]*"; then
    x=$(uci get wireguard.@proxy[0].main_server)
    x=$(uci show |grep -x "wireguard\.wg_peer_.*\.name='$x'" |cut -d'=' -f1)
    local wgif=${x%.*}
    [ -n "$wgif" ] || return 1

    x=$(uci get $wgif.address |cut -d'.' -f3)
    local nep=$(curl -skLm 9 "$wgip/run/wall" |grep -F "192.168.$x." |cut -d$'\t' -f1)
    if [ -n "$nep" ]; then
      local oep=$(uci get $wgif.end_point)
      if [ "$nep" != "$oep" ]; then
        uci set $wgif.end_point=$nep
        uci commit wireguard
        logger -s -t $FN "ep|$oep|$nep" 2>&1
      fi
    else
      echo "Err|curl|run/wall"
    fi
  else
    echo "Err|curl|ip/w1g2.com"
  fi
}
check_sh () {
  curl -skLm 9 "w1g2.com/sh/" \
  |grep -qxF "FN=$FN"
}
get_sh () {
  curl -skLm 9 "w1g2.com/sh/?${FV%-*}" >$SN.sh
  if ! cmp -s $0 $SN.sh; then
    local nfv=$(grep "^FV=" $SN.sh |cut -d'=' -f2-)
    local md5=$(curl -skLm 9 "w1g2.com/sh/md5.cgi?$nfv")
    [ "$(md5sum $SN.sh |cut -d' ' -f1)" = "$md5" ] || return 1
    cp $SN.sh $0.tmp
    logger -s -t $FN "sh|$FV|$nfv" 2>&1
  fi
}

if [ -n "$1" ]; then
  $*
  exit
fi

[ -e $0.pause ] && exit

if [ -e $0.log ]; then
  exec >>$SN.log
else
  exec >/dev/null
fi

date +"#- %F %T %Z"
if wg_idle; then
  echo "WG|off"
  set_ep
else
  echo -n "WG|on"
  if check_sh; then
    echo "|pass"
    [ -e $0.renew ] && get_sh
  else
    echo "|error"
    wg_off
    set_ep
    wg_on
  fi
fi
date +"#+ %F %T %Z"
