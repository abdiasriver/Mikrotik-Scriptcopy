# MikrtoTik / RouterOS Scripts

## Mikrotik commands
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
## If your device also supports 5 GHz you will set up and bridge a second wireless interface:
```
/interface wireless
 set [ find default-name=wlan2 ] band=5ghz-a/n/ac channel-width=20mhz disabled=no \
 wireless-protocol=802.11 distance=indoors installation=indoor frequency=auto \
 mode=ap-bridge default-forwarding=no \
 ssid="SSID goes here" station-roaming=enabled

/interface bridge port add bridge=bridge1 interface=wlan2
```
