# Add chrome shortcut for V1 portal
$TargetFile = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$ShortcutFile = "$env:Public\Desktop\V1Chrome.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = "https://signin.v1.trendmicro.com/"
$Shortcut.Save()

# Add Edge shortcut for V1 portal
$TargetFile = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$ShortcutFile = "$env:Public\Desktop\V1Edge.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = "https://signin.v1.trendmicro.com/"
$Shortcut.Save()
