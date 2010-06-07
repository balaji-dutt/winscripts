; This AHK script will launch all "Communication" tools at one go.
; Primarily that consists of IM, Twitter & IRC.
; The script only deals with multi-protocol IM clients.
; ###### CONFIGURATION SECTION START ######
; # Give the full path for each client below #

IMpath := "C:\Programs\Pidgin\Pidgin.exe"
Twitpath := "C:\Programs\DestroyTwitter\DestroyTwitter.exe"
IRCpath := "C:\Programs\mIRC\mirc.exe"

; ###### CONFIGURATION SECTION END ######
; Do not touch anything below this unless you know what you are doing.

; ###### SCRIPT START ######

;Get client executable names
IMClient := GetExe(IMPath)
TwitClient := GetExe(TwitPath)
IRCClient := GetExe(IRCpath)

;Get client install paths
IMProgPath := GetPath(IMPath)
TwitProgPath := GetPath(TwitPath)
IRCProgPath := GetPath(IRCPath)

;Function to get client executable name given a path
GetExe(Fullpath){
	; Way simpler call to SplitPath function courtesy of the fine folks at the AHK forums.
	SplitPath, Fullpath, ExeName
	return %ExeName%
}

;Function to get client install path given a fully qualified path
GetPath(Fullpath){
	SplitPath, Fullpath,, Path
	return %Path%
}

;CheckApps(){

;Now get all process PIDs and check if all three apps are running
;For some reason that eludes me, process checking cannot be done using a function
;So we have to duplicate the code to get PIDs for every app, every time :rolleyes:
;global IMClient
;global TwitClient
;global IRCClient

Process,Exist,%IMClient%
IMPID = %ErrorLevel%
Process,Exist,%TwitClient%
TwitPID = %ErrorLevel%
Process,Exist,%IRCClient%
IRCPID = %ErrorLevel%

If (%IMPID% <> 0) && (%TwitPID% <> 0) && (%IRCPID% <> 0)
	{
	;Everything's running. What are we still doing here?
	MsgBox, 4096, , Everything is fine.
	} else {
	StartApps()
	}
;return 0
;}

StartApps(){
;The script allows for any one of the 3 clients to be running and still be called.
;In that situation, the script will launch only those clients that are not running.

;Check if IM is running else launch IM
	global IMpath
	global IMClient
	Process,Exist,%IMClient%
	IMPID = %ErrorLevel%
		if IMPID = 0
		{
			Run,%IMPath%,%IMProgPath%, UseErrorLevel
			if ErrorLevel = ERROR
			{
			MsgBox, 4096, , The IM Client %IMClient% could not be launched.`nCheck your path %IMpath%
			}
		}
;Check if Twitter is running else launch Twitter
		global Twitpath
		global TwitClient
		Process,Exist,%TwitClient%
		TwitPID = %ErrorLevel%
			if TwitPID = 0
			{
				Run,%Twitpath%,%TwitProgPath%, UseErrorLevel
				if ErrorLevel = ERROR
				{
				MsgBox, 4096, , The Twitter client %TwitClient% could not be launched.`nCheck your path %Twitpath%
				} 
			}
;Check if IRC is running else launch IRC
		global IRCpath
		global IRCClient
		Process,Exist,%IRCClient%
		IRCPID = %ErrorLevel%
			if IRCPID = 0
			{
			Run,%IRCpath%,%IRCProgPath%, UseErrorLevel
				if ErrorLevel = ERROR
				{
				MsgBox, 4096, , The Twitter client %IRCClient% could not be launched.`nCheck your path %IRCpath%
				} 
			}
			
;StartApps() ends here
}

