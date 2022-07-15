Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c websearch.bat"
oShell.Run strArgs, 1, true
