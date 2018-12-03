#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; Remove the ";" in front of "; !g::GetProcessDetails()" and load this script.  You can have an active window
; open and push alt + g to get the window details.  Then just call the function ToggleApp() and pass it the ouput
; of alt + g in order to assign that program to a hotkey
; !g::GetProcessDetails()

!e::ToggleApp("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", "chrome.exe")

!i::ToggleApp("C:\Users\ssweet\AppData\Local\hyper\Hyper.exe", "hyper.exe")

!f::ToggleApp("C:\Users\ssweet\AppData\Local\wavebox\Wavebox.exe", "wavebox.exe")

!a::ToggleApp("C:\Users\ssweet\AppData\Local\Programs\Microsoft VS Code\Code.exe", "Code.exe")

!.::ToggleApp("C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe", "devenv.exe")

!k::ToggleApp("C:\Users\ssweet\AppData\Local\gitkraken\app-4.0.5\gitkraken.exe", "gitkraken.exe")




ToggleApp(ProgramLocation, ProcessName) {
    If ProcessExist(ProcessName){
        WindowId := WinActive("ahk_exe" ProcessName)
        WinGet, WindowCount, Count, ahk_exe %ProcessName%
        If WindowId && WindowCount > 1 {
            WinSet, Bottom,, ahk_exe %ProcessName%
        }
        WinActivate, ahk_exe %ProcessName%
    }
    Else {
        Run, %ProgramLocation%
    }
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

GetProcessDetails() {
    WinGet, activeprocessname, ProcessName, A
    WinGet, activeprocesslocation, ProcessPath, A
    MsgBox, 
    (LTrim
        The active window ProgramLocation is "%activeprocesslocation%"
        The active window ProcessName is "%activeprocessname%"
    )
}

FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\jumpapp.lnk, %A_ScriptDir%