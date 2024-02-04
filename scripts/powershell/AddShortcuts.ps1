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

# disable Server Manager startup
Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask -Verbose

# Disable Edge fist-run wizard
$settings = 
[PSCustomObject]@{
    Path  = "SOFTWARE\Policies\Microsoft\Edge"
    Value = 1
    Name  = "HideFirstRunExperience"
} | group Path

foreach($setting in $settings){
    $registry = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey($setting.Name, $true)
    if ($null -eq $registry) {
        $registry = [Microsoft.Win32.Registry]::LocalMachine.CreateSubKey($setting.Name, $true)
    }
    $setting.Group | %{
        $registry.SetValue($_.name, $_.value)
    }
    $registry.Dispose()
}
