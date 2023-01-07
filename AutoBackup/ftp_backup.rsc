# FTP Credentials
:local FTPUser "ftpuser";
:local FTPPass "ftppassword";
:local FTPHost "ftphost";

:log info message=SystemBackup-Init;

# Get DateTime
:local months {"jan"="01"; "feb"="02"; "mar"="03"; "apr"="04"; "may"="05"; "jun"="06"; "jul"="07"; "aug"="08"; "sep"="09"; "oct"="10"; "nov"="11"; "dec"="12"}
:local ts [/system clock get time]
:local ds [/system clock get date]
:local month [:pick $ds 0 3]
:local mm (:$months->$month)
:set ts ([:pick $ts 0 2].[:pick $ts 3 5].[:pick $ts 6 8])
:set ds ([:pick $ds 7 11] . $mm . [:pick $ds 4 6])

# Set Filenames
:local FileNameExportSource ( "backup-" . $FTPUser . "-" . $ds . "-" . $ts . ".rsc")
:local FileNameExportTarget ( $ds . "-" . $ts . ".rsc")

:log info message=SystemBackup-Start;

# Export Configuration to File
:log info message=("SystemBackup-CreateExport to file:" . $FileNameExportSource);
/export compact file=$FileNameExportSource

# Upload Backup to FTP
:log info message=("SystemBackup-UploadBackup to FTP:" . $FTPUser . "@" . $FTPHost . "/" . $FileNameExportTarget);
/tool fetch address=$FTPHost src-path=$FileNameExportSource user=$FTPUser mode=ftp password=$FTPPass dst-path=$FileNameExportTarget upload=yes

# Delay time to finish the upload
:delay 60s;

# Find file name start with backup - then remove
:foreach i in=[/file find] do={:if ([:typeof [:find [/file get $i name] "backup-"]]!="nil") do={/file remove $i}}
:log info message=SystemBackup-TempFilesRemoved;
:log info message=SystemBackup-Finished;
