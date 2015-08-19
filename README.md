## PPPoE relay for [Xiaomi router Mini R1CM(小米路由Mini R1CM)](http://www.mi.com/miwifimini/ "") ##


### Objective ###

For some environment, people may need **PPPoE** to get public IP under NAT. **pppoe-relay** would help to passthrough PPPoE packets between WAN and LAN, even if WLAN. With it, you can build up your special network structure on your own.

To improve user-expierence, you can one-click to install everything on Windows 7/XP. Don't worry about the un-friendly interfaces in Linux system.

### What is PPPoE ###

This is a brief introduction in [Wikipedia](https://en.wikipedia.org/wiki/Point-to-point_protocol_over_Ethernet)

> The Point-to-Point Protocol over Ethernet (PPPoE) is a network protocol for encapsulating PPP frames inside Ethernet frames. It appeared shortly after the year 2000, in the context of the boom of the DSL as the solution for tunneling packets over the DSL connection to the ISP's IP network, and from there to the rest of the Internet. A 2005 networking book noted that "Most DSL providers use PPPoE, which provides authentication, encryption, and compression."[1] Typical use of PPPoE involves leveraging the PPP facilities for authenticating the user with a username and password, predominately via the PAP protocol and less often via CHAP.[2]

### Pre-requirement ###

This program is made for Xiaomi router Mini R1CM. Please check your board before starting.
```
root@XiaoQiang:~# cat /proc/xiaoqiang/model
R1CM
```

You have to enable SSH function in your Xiaomi router Mini first. For more detail, please check [MiWiFi – 开放平台](http://www1.miwifi.com/miwifi_open.html "MiWiFi – 开放平台")

### Components ###

- **Intergrated scripts** - bring up pppoe-relay while system boot up
-  **pppoe-relay** - builded from [RP-PPPoE](https://www.roaringpenguin.com/products/pppoe "RP-PPPoE") ([rp-pppoe-3.11.tar.gz](https://www.roaringpenguin.com/files/download/rp-pppoe-3.11.tar.gz "Download rp-pppoe-3.11.tar.gz"))
-  [**plink.exe/pscp.exe**](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html "plink.exe/pscp.exe") - Windows tools to interactive with Xiaomi router throught SSH/SCP 


### How to install ###


- Downlaod files
	1. git clone https://github.com/deren/mi_mini_pppoe_relay
	2. [ZIP file](https://github.com/deren/mi_mini_pppoe_relay/archive/master.zip "Download ZIP file")
- Update `DEFAULT_PW` in **mi\_mini\_pppoe\_relay\_config.cmd**
- If need, update `DEFAULT_IP` and `DEFAULT_ID` as well
- Double-click **mi\_mini\_pppoe\_relay\_install.bat** to install files to router


----------

### Note ###

- An OpenWrt build-in function [`soft_fast_path`](https://lists.openwrt.org/pipermail/openwrt-devel/2014-December/030179.html) would corrupt our pppoe-relay process. To make sure everything working well, the install script will stop `soft_fast_path` by default.
- pppoe-relay is a pure software program. When you are running a PPPoE connection under NAT, the CPU loading would be a little bit higher than original case.


### Thanks ###

|Organization|Logo|
|:-------------:|:-------------:|
|[Xiaomi technology 小米](http://www.mi.com/)      | ![](http://global.mifile.cn/webfile/globalimg/zh/2014/icon/site-logo.png "Xiaomi technology")  |
|[OpenWrt](https://openwrt.org/ "OpenWrt")|![](https://dev.openwrt.org/chrome/site/openwrt-logo.png "OpenWrt") |
|[RP-PPPoE](https://www.roaringpenguin.com/products/pppoe "RP-PPPoE")|![](https://www.roaringpenguin.com/images/RPSLogo.gif "RP-PPPoE")|
|[MediaTek MT7620](https://wikidevi.com/wiki/MediaTek_MT7620)|![](https://media.licdn.com/media/p/4/005/048/219/26dd61b.png "MediaTek")|
