# PASSWORD
/interface wireless security-profiles
set [ find default=yes ] authentication-types=wpa2-psk,wpa2-eap \
    supplicant-identity=MikroTik wpa2-pre-shared-key=MikroTik
add authentication-types=wpa-psk,wpa2-psk mode=dynamic-keys name=MikroTik \
    supplicant-identity="" wpa-pre-shared-key=MikroTik \
    wpa2-pre-shared-key=MikroTik
add authentication-types=wpa-psk,wpa2-psk mode=dynamic-keys name=MikroTikPub \
    supplicant-identity="" wpa-pre-shared-key=MikroTik \
    wpa2-pre-shared-key=MikroTik

# PUBLIC AND PRIVATE WIFI
/interface wireless
set [ find default-name=wlan2 ] band=5ghz-a/n/ac channel-width=\
    20/40/80mhz-Ceee country=spain disabled=no frequency=auto mode=ap-bridge \
    name=MikroTik security-profile=Security_Priv ssid=MikroTik
set [ find default-name=wlan1 ] band=2ghz-b/g/n channel-width=20/40mhz-Ce \
    country=spain default-forwarding=no disabled=no frequency=auto mode=\
    ap-bridge name=MikroTikPub security-profile=Security_Pub ssid=\
    MikroTikPub

# PUBLIC WIFI POOL
/ip pool
add comment="Public Wifi" name=dhcp-guests ranges=\
    10.8.0.10-10.8.0.220
/ip dhcp-server
add address-pool=dhcp-guests disabled=no interface=MikroTikPub name=\
    publicwifi
/interface bridge port
add bridge=bridge-lan interface=MikroTik
add bridge=bridge-lan interface=MikroTik2GHz
/ip address
add address=10.8.0.1/24 comment=publicwifi interface=MikroTikPub network=\
    10.8.0.0
/ip dhcp-server network
add address=10.8.0.0/24 dns-server=8.8.8.8,1.1.1.1 gateway=10.8.0.1 \
    netmask=24
/ip firewall address-list
add address=10.8.0.10-10.8.0.220 list=publicwifi
# NOT ACCESS LAN
/ip firewall filter
add action=drop chain=input comment="Public Wifi - Block Ports" dst-address=\
    10.8.0.1 dst-port=80,22,8291 protocol=tcp src-address-list=publicwifi
add action=drop chain=input comment="Public Wifi - Block LAN" dst-address=\
    192.168.1.0/24 src-address-list=publicwifi