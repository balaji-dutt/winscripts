; pseudo-code:
; count files in dir (and sub-dirs)
; launch delenda
; wait a while (10 mins?)
; count no. of files
; if there is a diff, kill delenda
; quit

Dim $folder, $firstsize, $firstcount, $secondsize, $secondcount, $diff, $loopcount, $procpid

$folder = "C:\Balaji's\Other Downloads\Completed Files\TV Shows"

$firstsize = DirGetSize($folder, 1)	 ;This is recursive
$firstcount = $firstsize[1]		 ; First value in array returned by DirGetSize is no. of files	

If ProcessExists("Delenda.exe") = 0 Then
	Run("C:\Programs\Delenda\Delenda.exe -c")
EndIf

$loopcount = 0

Do
	Sleep(300000) ;five minutes
		$loopcount = $loopcount +1
		If $loopcount = 10 Then ExitLoop; Waited 50 minutes and nothing has happened. Breaking out of loop to end task.
			$secondsize = DirGetSize($folder, 1)
			$secondcount = $secondsize[1]
			$diff = $secondcount - $firstcount
Until $diff > 0



$procpid = ProcessExists("Delenda.exe") ; Will return the PID or 0 if the process isn't found.
If $procpid Then 
	ProcessClose($procpid)
EndIf

