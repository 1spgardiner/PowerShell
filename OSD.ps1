Install-Module -Name OSD -Force
New-OSDCloud.template -Verbose

Install-Module -Name AzureAD -Force
Install-Module -Name WindowsAutopilotIntune -Force
Install-Module -Name Microsoft.Graph.Intune -Force 

#Run as Admin

Import-Module -Name OSD -scope CurrentUser
Import-Module -Name AzureAD 
Import-Module -Name WindowsAutopilotIntune 
Import-Module -Name Microsoft.Graph.Intune
Connect-MSGraph

$Path = 'C:\ProgramData\OSDCloud\Config\AutoPilotJSON'
If (!(Test-Path $Path)) {
    new-item -path $Path -ItemType directory
}
Get-AutopilotProfile | ConvertTo-AutopilotConfigurationJSON | Out-File "$Path\AutopilotProfile.json" -Encoding ASCII

New-OSDCloud.workspace -WorkspacePath c:\source\OSD\Workspace1
Edit-OSDCloud.winpe -CloudDriver "Dell" #"HP", "Nutanix", "Vmware"
Edit-OSDCloud.winpe -CloudDriver "HP"
Edit-OSDCloud.winpe -CloudDriver WiFi

New-OSDCloud.iso

Invoke-WebPSScript
