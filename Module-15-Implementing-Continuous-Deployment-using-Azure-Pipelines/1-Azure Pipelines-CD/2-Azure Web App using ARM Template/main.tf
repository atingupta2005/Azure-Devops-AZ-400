{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "applanName": {
            "type": "string",
            "minLength": 1,
         "defaultValue": "demoplan1000"
        },
        "applanSKU": {
            "type": "string",
            "allowedValues": [
                "Free",
                "Shared",
                "Basic",
                "Standard"
            ],
            "defaultValue": "Standard"
        },
        "applanWorkerSize": {
            "type": "string",
            "allowedValues": [
                "0",
                "1",
                "2"
            ],
            "defaultValue": "1"
        }
    },
    "resources": [
        {
            "name": "[variables('demoappName')]",
            "type": "Microsoft.Web/sites",
            "location": "[resourceGroup().location]",
            "apiVersion": "2015-08-01",
            "dependsOn": [
                "[concat('Microsoft.Web/serverfarms/', parameters('applanName'))]"
            ],
            "tags": {
                "[concat('hidden-related:', resourceGroup().id, '/providers/Microsoft.Web/serverfarms/', parameters('applanName'))]": "Resource",
                "displayName": "demoapp"
            },
            "properties": {
                "name": "[variables('demoappName')]",
                "serverFarmId": "[resourceId('Microsoft.Web/serverfarms/', parameters('applanName'))]"
            }
        },
        {
            "name": "[parameters('applanName')]",
            "type": "Microsoft.Web/serverfarms",
            "location": "[resourceGroup().location]",
            "apiVersion": "2014-06-01",
            "dependsOn": [],
            "tags": {
                "displayName": "applan"
            },
            "properties": {
                "name": "[parameters('applanName')]",
                "sku": "[parameters('applanSKU')]",
                "workerSize": "[parameters('applanWorkerSize')]",
                "numberOfWorkers": 1
            }
        }
    ],
    "variables": {
        "demoappName": "staging-app-4000"
    }
}