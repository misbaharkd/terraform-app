#!/bin/bash

# Define variables
RESOURCE_GROUP_NAME="rg-terraform-state"
STORAGE_ACCOUNT_NAME="mystorageaccount$RANDOM"  # Ensure a unique name
CONTAINER_NAME="mycontainer"
LOCATION="West Europe"

# Login to Azure (interactive or with a service principal)
# az login
# or for service principal
# az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# Create Resource Group
az group create --name $RESOURCE_GROUP_NAME --location "$LOCATION"

# Create Storage Account
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP_NAME --location "$LOCATION" --sku Standard_LRS

# Get Storage Account Key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' --output tsv)

# Create Blob Container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

# Create backend configuration file
cat > backend.tf <<EOF
terraform {
  backend "azurerm" {
    resource_group_name   = "$RESOURCE_GROUP_NAME"
    storage_account_name  = "$STORAGE_ACCOUNT_NAME"
    container_name        = "$CONTAINER_NAME"
    key                   = "terraform.tfstate"
  }
}
EOF

echo "Backend configuration created in backend.tf"

