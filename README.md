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
