# MikrtoTik / RouterOS Scripts

## Mikrotik commands

```
/system reset-configuration no-defaults=yes skip-backup=yes
```
```
/system clock set time-zone-name Asia/Singapore
/system clock set date Jan/07/2023
/system clock set time 12:52:00
/system identity set name="Mikrotik"
```
```
/ip service disable telnet,ftp,www,www-ssl,winbox,api,api-ssl
/ip service enable ssh
/ip service print
/ip dns set allow-remote-requests=no
/ip neighbor discovery-settings set discover-interface-list=none
```
```
/interface bridge add name=bridge1 \
 admin-mac=[/interface/ethernet/get value-name=mac-address ether1] \
 auto-mac=no
/interface bridge port add bridge=bridge1 interface=ether1
/ip dhcp-client add disabled=no interface=bridge1
```
## Upgrade RouterOS:
```
/system package update
 set channel=long-term
 check-for-updates
 download
/system reboot
```
## BIOS Update
```
/system routerboard upgrade
/system reboot
```
## Wifi Policy | Wifi Interface
```
/interface wireless security-profiles
 set [ find default=yes ] \
 authentication-types=wpa2-psk mode=dynamic-keys \
 supplicant-identity=MikroTik \
 wpa-pre-shared-key="Wi-Fi password goes here" \
 wpa2-pre-shared-key="Wi-Fi password goes here"
```
## 2.4Gghz 802.211b Interface
```
/interface wireless
 set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20mhz disabled=no \
 wireless-protocol=802.11 distance=indoors installation=indoor frequency=auto \
 mode=ap-bridge default-forwarding=no \
 ssid="SSID goes here" station-roaming=enabled
 ```
 ## Bridge Interface to Ethernet Port1

```
/interface bridge port add bridge=bridge1 interface=wlan1
```
## 5Ghz
```
/interface wireless
 set [ find default-name=wlan2 ] band=5ghz-a/n/ac channel-width=20mhz disabled=no \
 wireless-protocol=802.11 distance=indoors installation=indoor frequency=auto \
 mode=ap-bridge default-forwarding=no \
 ssid="SSID goes here" station-roaming=enabled

/interface bridge port add bridge=bridge1 interface=wlan2
```
## Other useful commands
```
/system package update print
/system health print
/system resource print
/system package print
/system ntp client print
/export terse
/interface bridge host print
/interface wireless registration-table print
/interface wireless snooper snoop wlan1
/interface wireless spectral-scan wlan1
/interface wireless spectral-history wlan1
/ping 8.8.8.8
```
### Add new user and disable admin
```commandline
/user add name=admin group=full password=admin123
/user disable 0
```
### DNS Settings
```commandline
/ip dns set allow-remote-requests=no
/ip dns set servers=8.8.8.8,8.8.4.4
```
## References:
* https://help.mikrotik.com/docs/display/ROS/First+Time+Configuration
* https://wiki.mikrotik.com/wiki/Manual:Securing_Your_Router
* https://help.mikrotik.com/docs/display/ROS/Wireless+Interface
* https://mer.vin/2019/12/mikrotik-default-config/
* https://forum.mikrotik.com/viewtopic.php?t=143446#p763655
* https://forum.mikrotik.com/viewtopic.php?t=143446#p873652
* https://forum.mikrotik.com/viewtopic.php?t=123233#p606442