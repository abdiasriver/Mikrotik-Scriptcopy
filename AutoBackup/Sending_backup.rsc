#### Script for sending Backup config files

# Config email data

:local emailFrom "sender@example.com";
:local emailUsername "sender@example.com";
:local emailServer "emailserver.pl";
:local emailPassword "SomeSecretPassword";
:local emailPort "587";
:local emailTo "backup@example.com";

# main backup
/tool e-mail set address=$emailServer from=$emailFrom password=$emailPassword port=$emailPort start-tls=yes user=$emailUsername
:if ([:len [/file find name=backup.rsc]] > 0) do={
    /file remove backup.rsc
    }
/export file=backup
:delay 00:00:05
/tool e-mail send file="backup.rsc" to=$emailTo body="System Export konfiguracji\nRouter:  $[/system identity get name] \nData: $[/system clock get time] $[/system clock get date]" subject="Backup: $[/system identity get name]"

# backup jako plik
:if ([:len [/file find name=backup.backup]] > 0) do={
    /file remove backup.backup
    }
/system backup save name="backup" dont-encrypt=yes
:delay 00:00:05
/tool e-mail send file="backup" to=$emailTo body="System Backup konfiguracji\nRouter:  $[/system identity get name] \nData: $[/system clock get time] $[/system clock get date]" subject="Backup: $[/system identity get name]"