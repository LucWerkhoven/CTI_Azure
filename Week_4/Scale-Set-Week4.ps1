$mySubscriptionId = '???'
$myResourceGroup = '???'
$myScaleSet1 = "myScaleSetWeb"
$myScaleSet2 = "myScaleSetData"
$myScaleSet3 = "myScaleSetApp"
$myScaleSet4 = "myScaleSetWoz"
$myLocation = 'westeurope'
$virtualNetworkName = 'myVnet'

$subnetWeb = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Web' -AddressPrefix '10.0.1.0/24'
$subnetData = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Data' -AddressPrefix '10.0.2.0/24'
$subnetApp = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-App' -AddressPrefix '10.0.3.0/24'
$subnetWoz = New-AzVirtualNetworkSubnetConfig -Name 'MySubnet-Woz' -AddressPrefix '10.0.4.0/24'
$vnet = New-AzVirtualNetwork -ResourceGroupName $myResourceGroup -Name $virtualNetworkName -AddressPrefix '10.0.0.0/16' `
  -Location $myLocation -Subnet $subnetWeb, $subnetData, $subnetApp, $subnetWoz

New-AzVmss `
  -ResourceGroupName $myResourceGroup `
  -VMScaleSetName $myScaleSet1 `
  -Location $myLocation `
  -VirtualNetworkName $virtualNetworkName `
  -SubnetName "MySubnet-Web" `
  -PublicIpAddressName "myPublicIPAddressWeb" `
  -LoadBalancerName "myLoadBalancerWeb"

New-AzVmss `
  -ResourceGroupName $myResourceGroup `
  -VMScaleSetName $myScaleSet2 `
  -Location $myLocation `
  -VirtualNetworkName $virtualNetworkName `
  -SubnetName "MySubnet-Data" `
  -PublicIpAddressName "myPublicIPAddressData" `
  -LoadBalancerName "myLoadBalancerData"

New-AzVmss `
  -ResourceGroupName $myResourceGroup `
  -VMScaleSetName $myScaleSet3 `
  -Location $myLocation `
  -VirtualNetworkName $virtualNetworkName `
  -SubnetName "MySubnet-App" `
  -PublicIpAddressName "myPublicIPAddressApp" `
  -LoadBalancerName "myLoadBalancerApp"

New-AzVmss `
  -ResourceGroupName $myResourceGroup `
  -VMScaleSetName $myScaleSet4 `
  -Location $myLocation `
  -VirtualNetworkName $virtualNetworkName `
  -SubnetName "MySubnet-Woz" `
  -PublicIpAddressName "myPublicIPAddressWoz" `
  -LoadBalancerName "myLoadBalancerWoz"
