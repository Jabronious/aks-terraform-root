# aks-terraform-root

This is a root repo to create a quick AKS cluster

1. Create storage account using script
    - it will set access key but you can retrieve it through other script
2. create service principal then login [Docs here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
    - `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`
    - `az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID`
3. use service principal values to plan and apply
4. if using `kubectl` use this command to connect it with AKS
    - `az aks get-credentials --resource-group [resource-group-name] --name [aks-cluster-name] --admin`

I need to find out how to include all of this in github actions
