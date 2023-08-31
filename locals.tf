locals {
  dns_name = var.component == "frontend" && var == "prod" ? "www" : "${var.component}-${var.env}"
}