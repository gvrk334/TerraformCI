### Azure policy definition to limit the resources deploy for only West Europe region ###
resource "azurerm_policy_definition" "region" {
  name                = "only-deploy-in-westeurope"
  policy_type         = "Custom"
  mode                = "All"
  display_name        = "my-policy-definition"
  management_group_id = azurerm_management_group.SallingGroup.id

  policy_rule = <<POLICY_RULE
 {
    "if": {
      "not": {
        "field": "location",
        "equals": "westeurope"
      }
    },
    "then": {
      "effect": "Deny"
    }
  }
POLICY_RULE
}

resource "azurerm_management_group_policy_assignment" "regionwerp" {
  name                 = "region-westeurope-policy"
  policy_definition_id = azurerm_policy_definition.region.id
  management_group_id  = azurerm_management_group.SallingGroup.id
}