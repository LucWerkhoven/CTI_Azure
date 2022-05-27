$code = Get-Random
$storageAccountName='storage' + [string]$code
$resourceGroupName='???'
$region='westeurope'
$shareName='myshare'
$TableName='table1'
$ContainerName = 'quickstartblobs'

$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
  -Name $storageAccountName `
  -Location $region `
  -SkuName Standard_LRS `
  -Kind StorageV2
 
$ctx = $storageAccount.Context
	
New-AzStorageContainer -Name $ContainerName -Context $ctx -Permission Blob

New-AzRmStorageShare `
    -StorageAccount $storageAccount `
    -Name $shareName `
    -EnabledProtocol SMB `
    -QuotaGiB 1024 | Out-Null

New-AzStorageTable -Name $TableName -Context $ctx
