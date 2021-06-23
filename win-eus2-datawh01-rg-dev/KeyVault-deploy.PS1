$resourceGroup = "win-eus2-datawh01-rg-dev"
$location = "East US2"
$templateFile = ".\KeyVault-deploy.json"
$parameterFile = ".\KeyVault-deploy.parameters.json"

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
  -Name deployAzureSQLSandboxKeyVault `
  -ResourceGroupName $resourceGroup `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile