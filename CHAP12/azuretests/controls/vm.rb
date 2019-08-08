control 'vm' do
title 'InspecTest VM'
desc "Check the compliance for the VM"
  describe azurerm_virtual_machine(resource_group: 'bookRg', name: 'bookvm') do
    it                                { should exist }
    its('location') { should eq 'westeurope'}
    its('properties.hardwareProfile.vmSize') { should eq 'Standard_DS1_v2'}
    its('properties.storageProfile.osDisk.osType') { should eq 'Linux' }
  end
end