<!---
- 👋 Hi, I’m @w1g2
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...


w1g2/w1g2 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->


[w1g2.org]: https://45.79.165.151 "w1g2.org"
[w1g2.org/run/wall]: http://45.79.165.151/run/wall "w1g2.org/run/wall"
[w1g2.org/run/qa]: http://45.79.165.151/run/qa "w1g2.org/run/qa"
[w1g2.org/run/q/101]: http://45.79.165.151/run/q/101 "w1g2.org/run/q/101"
[w1g2.org/run/use]: http://45.79.165.151/run/use "w1g2.org/run/use"
[w1g2.org/run/usage]: http://45.79.165.151/run/usage "w1g2.org/run/usage"
[w1g2.org/run/isp]: http://45.79.165.151/run/isp "w1g2.org/run/isp"
[w1g2.org/run/top]: http://45.79.165.151/run/top "w1g2.org/run/top"
[w1g2.org/run/sta]: http://45.79.165.151/run/sta "w1g2.org/run/sta"
[w1g2.org/run/stat]: http://45.79.165.151/run/stat "w1g2.org/run/stat"
[w1g2.org/run/stay]: http://45.79.165.151/run/stay "w1g2.org/run/stay"
[w1g2.org/run/stap]: http://45.79.165.151/run/stap "w1g2.org/run/stap"
[day.w1g2.org]: https://day.w1g2.org "day.w1g2.org"
[wireguard]: https://wireguard.com/install "wireguard.com/install"

## [w1g2.org][] ( ip@1: 45.79.165.151 <sub>since 2023-06-17 13:00</sub> )
w1g2.org 是使用 WireGuard 开源技术的公益翻墙 VPN。为了抗墙，以上链接是域名的数字地址而不是平常的域名地址，浏览器会显示安全警告，点击 Advanced，确认证书是赋予 w1g2.org 的，然后选择继续。

在使用 w1g2.org 前，你需要从开源网站 [WireGuard][] 下载和安装适合你系统的软件（国内用户请额外参考本页底部的 __安装方法__）。WireGuard 的技术设计和安全考虑都是一流的，已融入 Linux 系统的内核，是当今高科技界的主流 VPN 软件，而且服务器端和用户端的软件全部开源，质量有保证，没有见不得人的黑箱。

安装成功后，在 w1g2.org 首页上输入一个汉字，认证正确后会显示一个二维通信码和相应的 zip/conf 文件链接，然后：
* 手机系统可以扫描通信码，也可以下载导入码上面的 zip（安卓手机）或 conf 文件
* 计算机系统直接下载 conf 文件，再导入到安装好的程序中
* 在 conf 文件的链接上，按右键显示内容在新的页面上，可以用于手动输入设置

每个 IP 每天只能领取一个 WireGuard 通信码，但通信码是可以共享的，你几个手机和计算机可以只用一个，不影响任何一个的速度，只有在几个同时用时，才会影响他们的速度。你可以把通信码网页存盘（Firefox 用 html only，其他用 complete），所有的 zip/conf 文件和通信码都已嵌在同一个文件里，今后用浏览器打开可再现同样的网页。

![w1g2](w1g2.png "w1g2.png")


---
### 使用说明
* [w1g2.org/run/wall][] : 节点群组的对端（Endpoint） <br/>
服务器的 ip 或 port 可能时不时被墙，确认后服务器会做一定的调整然后重启，这时你的 __WireGuard 节点肯定不工作了，证明就是，WireGuard 的传输统计栏里的接受数字不会再增加__。发生这种情况后，用你的局域网 IP 地址（Address），在网页里找到对应群组的 __ip:port__，你的对端（Endpoint）如果不符合，手动修改后可以继续工作。
<br/><br/>
在安卓或苹果手机上修改对端的具体步骤（注意，只改“对端”一个值！）：<br/>
  1\. 点击名字看具体的各个设置值<br/>
  2. 点击顶部的图标“笔”开始编辑<br/>
  3. 用你接口下面的局域网IP地址<br/>
  4. 在上面网页里找到对应的那行<br/>
  5. 按照那行的前半部分，改写你节点下的对端<br/>
  6. 点击顶部的图标“磁盘”把改写过的设置存盘<br/>
  7. 开通WireGuard重新开始工作<br/>
<br/>

* [w1g2.org/run/use][] : 当天连过线的节点和当前在线的节点（最右端有 [n] 标志） <br/>
每个当天用过的节点都会列出来，加上它们上一次连接是今天的什么时间，以及它们上传和下载的流量。另外成功开通 WireGuard 后，w1g2.org 首页也会显示你的节点今天的流量累计。
<br/><br/>
一个机器一天内可能用过多个节点，如果这些节点的上传和下载流量总和超过 __2000(MB)__，服务器会封这个机器的 IP 地址，直到第二天零点所有节点清零，服务器重新开始计算。__你的机器 IP 被封后，你必须断开 WireGuard，否则哪里都去不了，包括本网站__。想核实的话，断开后可以去 w1g2 首页，首页会告诉你的机器 IP 是否已被封，没有的话会显示正常首页。
<br/><br/>
如果一个机器当天同时满足下列3条件，这个机器就可以用到 __3000(MB)__：<br/>
  1\. “上传流量”没有超过 200 (MB)<br/>
  2. “最大流速”没有超过 200 (MBpm)（等于1分钟内流量消耗了200MB）<br/>
  3. “有效在线”超过 120 分钟(min)（相当于累积在线4个小时）<br/>
<br/>

* [w1g2.org/run/qa][] : 节点最后一次使用的日期和有效公钥的前8位 <br/>
过去15天内没被人用过的节点会被服务器回收利用，需要一个新的，就回收一个。另外还可以用 [w1g2.org/run/q/101][] 只查看第1个节点群组，这里101是局域网地址（192.168.101.*）的第3节，以此类推，用102到109替代101可以查看第2个到第9个节点群组。
<br/><br/>

* [day.w1g2.org][] : 本网备用 VPN ( ip@2: 45.33.84.239 ) <br/>
每天每个 IP 最多只能用 1GB 流量，所有节点都只有当天有效，过了北京时间零点就必须领一个新的通信码。用户如果由于什么原因无法使用本网的主要VPN，可以暂时使用这个备用VPN。


---
### 网站公示
* [w1g2.org/run/top][] : 实时服务器后台运行的全部程序

* [w1g2.org/run/usage][] : 当天每分钟的在线节点数和流量

* [w1g2.org/run/isp][] : 当天中国用户的来源和从属于的服务商

* [w1g2.org/run/sta][] : 过去30天服务器的流量总结

* [w1g2.org/run/stat][] : 过去15天用户节点的流量总结

* [w1g2.org/run/stap][] : 过去7天服务器的端口流量总结

* [w1g2.org/run/stay][] : 过去7天每15分钟的在线节点数和流量


---
### 安装方法
* __Windows 系统__ <br/>
WireGuard 网站为 Windows 系统提供的 EXE 安装文件，安装过程中需要联系他们自己的网站下载适合你机器的 MSI 文件，但网站本身就是被墙的，所以安装会失败。注意在 [Download Windows Installer][wireguard] 链接下面，还有一个 [Browse MSIs] 的链接，点进去以后，使用 Windows 7 以上系统的，选第一个 MSI ( [本地链接](https://raw.githubusercontent.com/w1g2/w1g2/main/wg-clients/wireguard-amd64-0.5.3.msi) ) 下载安装。使用 Windows XP 系统的，选第三个 MSI ( [本地链接](https://raw.githubusercontent.com/w1g2/w1g2/main/wg-clients/wireguard-x86-0.5.3.msi) ) 下载安装。

* __安卓手机__ <br/>
无法用谷歌 Play Store 直接安装 WireGuard 的中国安卓手机，可以去 WireGuard 官方网站，注意在 Android 的 [Download from Play Store][wireguard] 下面有 F-Droid 的链接，从那里可以直接下载 APK 文件 ( [本地链接](https://raw.githubusercontent.com/w1g2/w1g2/main/wg-clients/com.wireguard.android-1.0.20230526.apk) )，然后手动在安卓手机上安装。这个链接列在 WireGuard 的官方网页里，等于有他们团队的背书。

* __苹果手机__ <br/>
用中国区账号的苹果手机，必须先在 App Store（不是手机设置）里退出，再暂时登录一个美国区账号，然后搜索下载安装 WireGuard，最后退出再登录原来的中国区账号。下面链接的知乎文章详细解释了怎么登记一个新的美国区账号 ( [本地链接](https://raw.githubusercontent.com/w1g2/w1g2/main/wg-clients/us-acct.pdf) ) ： <br/>
[【2022年】五分钟注册美区Apple ID，手把手教，稳定且耐用！](https://zhuanlan.zhihu.com/p/367821925)
