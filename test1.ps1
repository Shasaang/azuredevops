[CmdletBinding()]
param( $aname,
       $asname,
       $rgname
)

$dyobject = @{
 'webAppName' = $aname
 'appServicePlanName' = $asname
 'Location' = 'Central US'
 'StorageTier' =  'S1'
}

$rg=$rgname
$loc="Central US"

$password = ConvertTo-SecureString 'Palak@023' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('komal.l@hcl.com', $password)

#login to subscrption
login-azureRmAccount -Credential $Credential
Select-AzureRmSubscription -SubscriptionId b1664222-374f-4c99-8fe4-cba23c99ee0e

#create resource group
New-AzurermResourceGroup -Name $rg -Location $loc

# Create an App Service plan and App Service in Free tier.
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateUri sha.json -TemplateParameterObject $dyobject
