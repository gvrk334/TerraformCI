resource "azurerm_management_group" "SallingGroup" {
  display_name = "Salling Group"

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "Platform" {
  display_name               = "Platform"
  parent_management_group_id = azurerm_management_group.SallingGroup.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

resource "azurerm_management_group" "Network" {
  display_name               = "Network"
  parent_management_group_id = azurerm_management_group.Platform.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

resource "azurerm_management_group" "Identity" {
  display_name               = "Identity"
  parent_management_group_id = azurerm_management_group.Platform.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
  # other subscription IDs can go here
}

resource "azurerm_management_group" "Management" {
  display_name               = "Management"
  parent_management_group_id = azurerm_management_group.Platform.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "LandingZone" {
  display_name               = "Landing Zone"
  parent_management_group_id = azurerm_management_group.SallingGroup.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "Production" {
  display_name               = "Production"
  parent_management_group_id = azurerm_management_group.LandingZone.id

  subscription_ids =  [
        #data.azurerm_subscription.current.subscription_id,
    ] 
}

resource "azurerm_management_group" "Non-Production" {
  display_name               = "Non-Production"
  parent_management_group_id = azurerm_management_group.LandingZone.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}

resource "azurerm_management_group" "SharedInfra" {
  display_name               = "Shared Infrastructure Services"
  parent_management_group_id = azurerm_management_group.LandingZone.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}


resource "azurerm_management_group" "Sandbox" {
  display_name               = "Sandbox"
  parent_management_group_id = azurerm_management_group.SallingGroup.id

  subscription_ids = [
    #data.azurerm_subscription.current.subscription_id,
  ]
}