## PPPoE relay for Xiaomi router Mini ##

### Objective ###

For some environment, people may need **PPPoE** to get public IP under NAT. **pppoe-relay** would help to passthrough PPPoE packets between WAN and LAN, even if WLAN. With it, you can build up your special network structure on your own.

To improve user-expierence, you can one-click to install everything on Windows 7/XP. Don't worry about the un-friendly interfaces in Linux system.

### Components ###

- **Intergrated scripts** - bring up pppoe-relay while system boot up
-  **pppoe-relay** - builded from [RP-PPPoE](https://www.roaringpenguin.com/products/pppoe "RP-PPPoE")
-  [**plink.exe/pscp.exe**](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html "plink.exe/pscp.exe") - Windows tools to interactive with Xiaomi router throught SSH/SCP 

### Pre-requirement ###

You have to enable SSH function in your Xiaomi router Mini first. For more detail, please check [http://www1.miwifi.com/miwifi_open.html](http://www1.miwifi.com/miwifi_open.html)

### How to install ###


- Downlaod files
	1. git clone https://github.com/deren/mi_mini_pppoe_relay
	2. [ZIP file](https://github.com/deren/mi_mini_pppoe_relay/archive/master.zip "Download ZIP file")
- Update `DEFAULT_PW` in **mi\_mini\_pppoe\_relay\_config.cmd**
- If need, update `DEFAULT_IP` and `DEFAULT_ID` as well
- Double-click **mi\_mini\_pppoe\_relay\_install.bat** to install files to router
