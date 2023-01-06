/export file=[Filename];
/system backup save name=[Filename];
/tool e-mail send to=["Email"] subject=([/system identity get name]."Backup") body=("Mikrotik Configuration Backup for - ".[/system clock get date]) file=[Filename.rsc],[Filename.backup];
/log info "Backup e-mail sent.";