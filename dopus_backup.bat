cd \
xcopy "C:\Documents and Settings\duttb\Application Data\GPSoftware\Directory Opus\*.*" "C:\batch\dopus_backup\dopus\" /Q /E /C /H /Y /D /Z
xcopy "C:\Documents and Settings\All Users\Application Data\GPSoftware\Directory Opus\*.*" "C:\batch\dopus_backup\dopusglobal\" /Q /E /C /H /Y /D /Z
xcopy "C:\Documents and Settings\duttb\Local Settings\Application Data\GPSoftware\Directory Opus\*.*" "C:\batch\dopus_backup\dopuslocal\" /Q /E /C /H /Y /D /Z
exit