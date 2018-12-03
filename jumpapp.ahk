#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

!e::ToggleApp("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", "chrome.exe")

!i::ToggleApp("C:\Users\ssweet\AppData\Local\hyper\Hyper.exe", "hyper.exe")

!f::ToggleApp("C:\Users\ssweet\AppData\Local\wavebox\Wavebox.exe", "wavebox.exe")

!a::ToggleApp("C:\Users\ssweet\AppData\Local\Programs\Microsoft VS Code\Code.exe", "Code.exe")

!.::ToggleApp("C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe", "devenv.exe")

!k::ToggleApp("C:\Users\ssweet\AppData\Local\gitkraken\app-4.0.5\gitkraken.exe", "gitkraken.exe")



ToggleApp(location, exe) {
    If ProcessExist(exe){
        WindowId := WinActive("ahk_exe" exe)
        WinGet, WindowCount, Count, ahk_exe %exe%
        If WindowId && WindowCount > 1 {
            WinSet, Bottom,, ahk_exe %exe%
        }
        WinActivate, ahk_exe %exe%
    }
    Else {
        Run, %location%
    }
}

ProcessExist(Name){
	Process,Exist,%Name%
	return Errorlevel
}

FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\jumpapp.lnk, %A_ScriptDir%