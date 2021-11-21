#https://azure.microsoft.com/en-gb/global-infrastructure/services/?regions=non-regional,united-kingdom-south,united-kingdom-west&products=all

Connect-azaccount

#Get Location
$location=""
# Select Location
Get-AzLocation | Select Location, DisplayName | Sort DisplayName
[string]$location= "uksouth"


Get-AzVMImagePublisher -Location $location | select PublisherName | Where {$_.PublisherName -like 'MicrosoftWindows*'} #| Out-GridView -OutputMode Single
<#
MicrosoftWindowsDesktop      
MicrosoftWindowsServer       
MicrosoftWindowsServerHPCPack
#>

$Publisher = "MicrosoftWindowsServer"

# Get the list of offering from the publisher with in the location
Get-AzVMImageOffer -Location $Location -PublisherName $Publisher | Select Offer
$Offer = "WindowsServer"

# Get the list of image skus available in the given location from the given publisher with the given offerings
Get-AzVMImageSku -Location $Location -PublisherName $Publisher -Offer $Offer | Select Skus | Out-GridView



Get-AZVMSize -Location $location |out-gridview