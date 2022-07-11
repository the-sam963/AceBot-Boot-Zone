Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c boot.bat"
oShell.Run strArgs, 0, false