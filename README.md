# aks-terraform-root

This is a root repo to create a quick AKS cluster

1. Create storage account using script 
    - it will set access key but yo ucan retrieve it through other script
2. create service principal then login [Docs here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
    - `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`
    - `az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID`
3. use service principal values to plan and apply

I need to find out how to include all of this in github actions