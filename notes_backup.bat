cd \
xcopy "C:\lotus\notes\*.ini" "H:\Notes_Backup\" /Q /E /C /H /Y /D /Z
xcopy "C:\lotus\notes\data\*.*" "H:\Notes_Backup\data\" /Q /EXCLUDE:E:\batch\exclude.txt /E /C /H /Y /D /Z
exit