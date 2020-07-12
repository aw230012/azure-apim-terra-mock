variable "api-rg-name" {
    type = string
}
variable "api-region" {
    type = string
}
variable "apim-name" {
    type = string
}
variable "publisher-name" {
    type = string
}
variable "publisher-email" {
    type = string
}
variable "api-sku" {
    type = string
    default = "Developer_1"
}
variable "api-spec-path" {
    type = string
}
variable "apim-api-name" {
    type = string
}
variable "apim-api-revision" {
    type = string
}
variable "apim-api-display-name" {
    type = string
}
variable "apim-api-path" {
    type = string
}
variable "apim-policy-file" {
    type = string
}
