# Add shortcut for V1 portal
$TargetFile = "https://portal.xdr.trendmicro.com"
$ShortcutFile = "$env:Public\Desktop\V1.URL"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

# placeholder
