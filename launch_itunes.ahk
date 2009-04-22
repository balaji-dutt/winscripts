; This script will do the following:
;
; 1. Check if iTunes is running already. If it finds iTunes running, activate the application to the foreground
;    If not, it will launch iTunes.
; 2. Launch (or find) iSproggler
; 3. Launch (or find) iTunes Control
;
; Ideally, there would be some way to then "stack" the icons of the 3 apps together. But right now, I have no idea 
; how to achieve that.

#SingleInstance force
DetectHiddenWindows on

; Check if iTunes is running. If yes, restore the application ("Blank" winactivate works for apps minimized to tray)
; 							  If no, then launch iTunes
Process, Exist, iTunes.exe
ErrorLevel = 1
{
Run, C:\Programs\iTunes\iTunes.exe
} 
    
;Since iTunes is a slow-loading app, we first check to see if iTunes has actually activated.
;Once it finds iTunes, it looks for iSproggler. If no process if found, it will launch iSproggler.
;Else the loop dies silently.

Process, Exist, iTunes.exe
ErrorLevel = 1
{
Process, Exist, iSproggler.exe
ErrorLevel = 0
{
Run, C:\Programs\iSproggler\iSproggler.exe
} 
}

;Same logic as with iSproggler, except this time we are launching iTunes Control
Process, Exist, iTunes.exe
ErrorLevel = 1
{
Process, Exist, iTunesCtl.exe
ErrorLevel = 0
{
Run, C:\Programs\iTunesControl\iTunesCtl.exe
} 
}

