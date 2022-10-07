<!---
- 👋 Hi, I’m @w1g2
- 👀 I’m interested in ...
- 🌱 I’m currently learning ...
- 💞️ I’m looking to collaborate on ...
- 📫 How to reach me ...


w1g2/w1g2 is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->


[w1g2.com]: https://104.200.28.75 "w1g2.com"
[w1g2.com/run/wall]: https://104.200.28.75/run/wall "w1g2.com/run/wall"
[w1g2.com/run/use]: https://104.200.28.75/run/use "w1g2.com/run/use"
[w1g2.com/run/node]: https://104.200.28.75/run/node "w1g2.com/run/node"
[w1g2.com/run/isp]: https://104.200.28.75/run/isp "w1g2.com/run/isp"
[w1g2.com/run/top]: https://104.200.28.75/run/top "w1g2.com/run/top"
[w1g2.com/run/sta]: https://104.200.28.75/run/sta "w1g2.com/run/sta"
[w1g2.com/run/stat]: https://104.200.28.75/run/stat "w1g2.com/run/stat"
[wireguard]: https://wireguard.com/install "wireguard.com/install"

## [w1g2.com][] (ip: 104.200.28.75)
w1g2.com 是使用 WireGuard 开源技术的公益翻墙 VPN。为了抗墙，以上链接是域名的数字地址而不是平常的域名地址，浏览器会显示安全警告，点击 Advanced，确认证书是赋予 www.w1g2.com 的，然后选择继续。

在 w1g2.com 首页上输入一个汉字，认证正确后会显示一个二维通信码，在使用通信码前，你需要从开源网站 [WireGuard][] 下载和安装适合你系统的软件。 WireGuard 的技术设计和安全设计都是一流的，已融入 Linux 系统的内核，服务器端和用户端的软件全都是开源的，质量有保证，没有见不得人的暗处。

安装成功后：
* 手机系统可以扫通信码，也可以下载导入码上面的 zip 或 conf 文件而自动设置
* 计算机可以下载 conf 文件，再导入到安装好的程序中而自动设置
* 在 conf 文件的链接上，按右键显示内容在新的页面上，可以用于手动输入设置

一个 IP 一天只能领取一个 WireGuard 通信码，但通信码是可以共享的，你几个手机和计算机可以只用一个，不影响任何一个的速度，只有在几个同时用时，才会影响他们的速度。

服务器运行一段时间后，会开始回收利用过去60天内没被人用过的节点，按生成时间来排，需要一个新的，就回收一个，没新节点需要，就没回收。

![w1g2](w1g2.png "w1g2.png")


---
### 使用说明
* [w1g2.com/run/wall][] : 节点群组的对端（Endpoint） <br/>
服务器的 ip 或 port 可能时不时被墙，服务器就需要做一定的调整，但你的 WireGuard 就不工作了，传输统计栏里的接受数字也不会再增加。用你的局域网IP地址（Address），在网页里找到对应的那一行（192.168.1??.*/24），你的对端（Endpoint）必须符合同一行开头的 __ip:port__ ，如果不符合，你手动修改后就可以继续工作。

* [w1g2.com/run/use][] : 当天连过线的节点和当前在线的节点（最右端有[n]标志） <br/>
每个当天用过的节点都会列出来，加上它们上一次连接的时间和流量的统计。另外成功开通 WireGuard 后，w1g2.com 首页也会显示你的节点今天的流量累计。

* [w1g2.com/run/node][] : 当天上传和下载的总流量超过 1000(MB) 的节点 <br/>
一个机器一天内可能用过多个节点，如果这些节点的上传和下载流量总和超过 __2000(MB)__，或者其中一个节点 __5分钟内__ 总流量增加了 __1000(MB)__，服务器会封这个机器的 IP 地址，直到第二天零点所有节点清零，服务器重新开始计算。__你的机器 IP 被封后，你必须断开 WireGuard，否则哪里都去不了__，想核实的话，断开后可以去 w1g2 首页，首页会告诉你的机器 IP 是否已被封，没有的话会显示正常首页。


---
### 网站公示
* [w1g2.com/run/isp][] : 当天用过翻墙从中国来的服务商

* [w1g2.com/run/top][] : 服务器实时运行的全部后台程序

* [w1g2.com/run/sta][] : 服务器过去30天的运行数据总结

* [w1g2.com/run/stat][] : 用户节点过去10天的运行数据总结


---
### 安装方法
* __安卓手机__ <br/>
无法使用谷歌 Play Store 的中国安卓手机，可以去 WireGuard 官方网站，注意在 Android 的 [Download from Play Store][wireguard] 下面有 F-Droid 的链接，从那里可以直接下载 apk 文件，然后手动在安卓手机上安装，列在 WireGuard 的网页里等于有他们团队的背书。

* __苹果手机__ <br/>
用中国区账号的苹果手机，想安装 WireGuard 的话，必须先在App Store（不是手机设置）里退出，再暂时登录一个美国区账号，搜索下载安装 WireGuard，然后退出再登录原来的中国区账号。下面链接的知乎文章详细解释了怎么登记一个新的美国区账号： <br/>
[【2022年】五分钟注册美区Apple ID，手把手教，稳定且耐用！](https://zhuanlan.zhihu.com/p/367821925)

* __Windows 系统__ <br/>
WireGuard 网站为 Windows 系统提供的EXE安装文件，是为了墙外安装的，安装过程中需要联系网站，但网站本身就是被墙的，所以不工作。注意在 [Download Windows Installer][wireguard] 链接下面，还有一个 [Browse MSIs] 的链接，点进去以后选第一个MSI下载，然后就可以直接安装了。
