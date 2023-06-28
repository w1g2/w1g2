
[w1g2.org/run/wall]: https://w1g2.org/run/wall "w1g2.org/run/wall"


## Scripts for auto-adjusting Endpoint value
This folder contains scripts for some OS to auto-adjust Endpoint value by querying w1g2.org periodically.


---
### wg-cron.sh (OpenWrt)
Download and save the script as /root/bin/wg-cron.sh, then run following commands for various purposes.

```/root/bin/wg-cron.sh set_up```<br/>
schedule a cron job to be run every 5 minutes between 10:00am and 11:00am

```/root/bin/wg-cron.sh toggle_log```<br/>
toggle logging to /tmp/wg-cron.log

```/root/bin/wg-cron.sh toggle_renew```<br/>
toggle checking for new version with w1g2.org


---
### w1g2.cmd (Windows)
Download and save the script on Desktop as __w1g2.cmd__, rename an existing or fetch a new conf file as __w1g2.conf__ on Desktop too.

This script will run a Windows service named __WireGuardTunnel$w1g2__, which operates independently of any your existing WireGuard tunnels.  It'll install, run, and uninstall the service during its session.  You need to keep its CMD prompt open throughout a WireGuard session.  The script will check the status of WireGuard every 5 minutes, and will query [w1g2.org/run/wall][] for updated __Endpoint__ values if there's no change in the __Received__ bytes of WireGuard's transfer.  No change of Received bytes over a period implies that a WireGuard tunnel is not working.
