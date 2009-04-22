@echo off
REM Access to shared folders on Prod Server removed due to "audit" issues 9:44 AM 11/12/2008
REM net use S: \\pamsfmapl1\Sylvan_Interface /persistent:no
net use U: \\pfmsapl5\SylvanApp /persistent:no
exit