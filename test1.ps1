[CmdletBinding()]
param( $appname,
       $aspname,
       $rgname
)

$dyobject = @{
 'webAppName' = $appname
 'appServicePlanName' = $aspname
 'Location' = 'Central US'
 'StorageTier' =  'S1'
}

$rg=$rgname
$loc="Central US"

$password = ConvertTo-SecureString 'Palak@023' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('komal.l@hcl.com', $password)

#login to subscrption
login-azureRmAccount -Credential $Credential
Select-AzureRmSubscription -SubscriptionId 83f64421-ba30-4f5c-974e-c09331cf25b9

#create resource group
New-AzurermResourceGroup -Name $rg -Location $loc

# Create an App Service plan and App Service in Free tier.
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateUri https://raw.githubusercontent.com/Shasaang/azuredevops/master/sha.json -TemplateParameterObject $dyobject
