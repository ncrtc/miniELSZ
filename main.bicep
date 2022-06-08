
param prefix string = substring(uniqueString(subscription().id,resourceGroup().id),0,6)
param location string = resourceGroup().location

//create law
resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-10-01' = {
  name: 'loganalytics${prefix}'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

//create storate
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: 'storage${prefix}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
