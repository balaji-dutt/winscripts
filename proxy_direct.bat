@echo off
cd \
cd batch
net stop wingateengine
regedit /s wingate_wwwproxy_direct.reg
regedit /s wingate_ftpproxy_direct.reg
regedit /s wingate_ftpproxy2_direct.reg
net start wingateengine
exit