param accounts_SpeechGlobalBot_name string = 'SpeechGlobalBot'
param accounts_TranslatorGlobalBot_name string = 'TranslatorGlobalBot'

resource accounts_SpeechGlobalBot_name_resource 'Microsoft.CognitiveServices/accounts@2025-04-01-preview' = {
  name: accounts_SpeechGlobalBot_name
  location: 'westus3'
  sku: {
    name: 'F0'
  }
  kind: 'SpeechServices'
  identity: {
    type: 'None'
  }
  properties: {
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}

resource accounts_TranslatorGlobalBot_name_resource 'Microsoft.CognitiveServices/accounts@2025-04-01-preview' = {
  name: accounts_TranslatorGlobalBot_name
  location: 'westus3'
  tags: {
    Project: 'GlobalTeamBot'
    Owner: 'Eveangalina Campos'
    Environment: 'Dev'
    Purpose: 'CrossLanguageCollaboration'
  }
  sku: {
    name: 'F0'
  }
  kind: 'TextTranslation'
  identity: {
    type: 'None'
  }
  properties: {
    customSubDomainName: 'translatorglobalbot'
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    allowProjectManagement: false
    publicNetworkAccess: 'Enabled'
  }
}
