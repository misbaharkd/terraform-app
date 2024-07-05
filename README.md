<<<<<<< HEAD
# backendapp
Repo for backend application deployed in Azure AKS
=======
# Terraform App Deployment

This project uses Terraform to deploy a full-stack application on Azure. The application is structured into various modules for better organization and manageability.

## Project Structure


terraform-app/
├── index.html
├── modules/
│ ├── frontend/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── backend/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── api_gateway/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── azure_db/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── cdn/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ ├── vnet/
│ │ ├── main.tf
│ │ ├── variables.tf
│ │ └── outputs.tf
│ └── dns/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── main.tf
├── variables.tf
└── outputs.tf



## Modules Overview

- **frontend/**: Deploys an App Service with an HTML/JavaScript frontend.
- **backend/**: Sets up an AKS (Azure Kubernetes Service) cluster.
- **api_gateway/**: Configures an API Gateway.
- **azure_db/**: Provisions an Azure Database for MySQL.
- **cdn/**: Sets up an Azure CDN for serving static content.
- **vnet/**: Creates a Virtual Network (VNet) with subnets, NSGs, and DDoS protection.
- **dns/**: Configures a DNS public zone.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- Azure subscription
- [Jenkins](https://www.jenkins.io/download/) server with the Terraform plugin installed

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/misbaharkd/terraform-app.git
   cd terraform-app
Configure backend for state storage:
Modify main.tf to configure the backend to store the state file in Azure Blob Storage:


**Terraform backend**

terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform-state"
    storage_account_name  = "tfstate<random_suffix>"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}


## Initialize and apply Terraform:

 ```bash

   Copy code

   terraform init

   terraform apply
>>>>>>> bbcaf44663dfa13c79459960bfa959f7a5e2bff8
