# Install the telnet Client
Install-WindowsFeature Telnet-Client

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
# Start the sshd service
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
# Reference https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=powershell
