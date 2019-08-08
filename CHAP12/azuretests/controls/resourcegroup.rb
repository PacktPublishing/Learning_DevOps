control 'rg' do
title 'InspecTest RG'
desc "Check the compliance for the resource group"
  describe azurerm_resource_groups do #call the azurerm_resource_groups of Azure Resource Pack
      its('names') { should include 'bookRg' } #Test assert
  end
end