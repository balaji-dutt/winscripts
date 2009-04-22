@echo off
cd \
cd batch
net stop wingateengine
regedit /s wingate_wwwproxy_socks.reg
regedit /s wingate_ftpproxy_socks.reg
regedit /s wingate_ftpproxy2_socks.reg
net start wingateengine
exit