$resourceGroup = "gdm-eus2-vdi-rg-dev"
$location = "East US2"
$templateFile = ".\azuredeploy.json"
$parameterFile = ".\azuredeploy.parameters.gdm-vdi-vm01.json"

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
  -Name deployGMVDIVM01 `
  -ResourceGroupName $resourceGroup `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile