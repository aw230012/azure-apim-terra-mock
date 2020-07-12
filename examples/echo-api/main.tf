provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
module "mock-api" {
    source = "../../modules/apim"
    api-rg-name = "MockApi-rg"
    api-region = "eastus2"
    apim-name = "TerraMockApi"
    publisher-name = "Crossface Studios"
    publisher-email = "notarealemail@nope.com"
    api-spec-path = "${path.module}/echo-api.yaml"
    apim-api-name = "echo-mock-api"
    apim-api-revision = "1"
    apim-api-display-name = "Echo Mock Api"
    apim-api-path = "echo-mock"
    apim-policy-file = "mock-policy.xml"
}
