control "subnet" do
title 'InspecTest Subnet'
desc "Check the compliance for the Subnet"
  describe azurerm_subnet(resource_group: 'bookRg', vnet: 'book-vnet', name: 'book-subnet') do #call the azurerm_subnet lib
    it { should exist } #test the existance of the subnet
    its('address_prefix') { should eq '10.0.10.0/24' } #test the IP range of the subnet
  end
end