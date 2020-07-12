resource "azurerm_resource_group" "api-rg" {
        name = var.api-rg-name
        location = var.api-region
}
data "local_file" "api-spec" {
    filename = var.api-spec-path
}
resource "azurerm_api_management" "mock-apim" {
  name                = var.apim-name
  location            = azurerm_resource_group.api-rg.location
  resource_group_name = azurerm_resource_group.api-rg.name
  publisher_name      = var.publisher-name
  publisher_email     = var.publisher-email

  sku_name = var.api-sku

  policy {
    xml_content = file(var.apim-policy-file)
  }
}
resource "azurerm_api_management_api" "mock-api" {
  name                = var.apim-api-name
  resource_group_name = azurerm_resource_group.api-rg.name
  api_management_name = azurerm_api_management.mock-apim.name
  revision            = var.apim-api-revision
  display_name        = var.apim-api-display-name
  path                = var.apim-api-path
  protocols           = ["https"]

  import {
    content_format = "openapi"
    content_value  = data.local_file.api-spec.content
  }
}
