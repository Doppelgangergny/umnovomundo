Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "%USERPROFILE%\\sugas.bat", 0, True
Wscript.Sleep 20000
Dim fso
Set fso = CreateObject ("Scripting.FileSystemObject")
filepath="%USERPROFILE%\\sugas.bat"
fso.DeleteFile(filepath)