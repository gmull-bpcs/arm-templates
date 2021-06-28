$resourceGroup = "win-eus2-trux-rg-dev"
$location = "East US2"
$templateFile = ".\azuredeploy-azurevm-truxsql.json"
$parameterFile = ".\azuredeploy.azurevm.parameters.truxsql.json"
$deploymentName = 'deployAzureVMTruxSQLSvr'

# Check if Resource Group Exists
Get-AzResourceGroup -Name $resourceGroup -ErrorVariable notPresent -ErrorAction SilentlyContinue

if ($notPresent)
{
    # ResourceGroup doesn't exist
    New-AzResourceGroup -Name $resourceGroup -Location $location
}
else
{
    # ResourceGroup exist
}

# Deploy ARM Template
New-AzResourceGroupDeployment `
  -Name $deploymentName `
  -ResourceGroupName $resourceGroup `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile