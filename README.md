# aks-terraform-root

## Purpose

The goal of this repo is to provide anyone the ability to quickly spin up their own bare bones Azure Kubernetes Service (AKS). Not only does this provide the ground work to manual deploy using terraform from the command line but can also be apart of a CI/CD flow using Github Actions.

## Dependencies

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

- [kubectl](https://kubernetes.io/docs/tasks/tools/)

- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Setup

1. Create storage account using `create-storage-account.sh`
    - it will set an access key but you can retrieve it through `get-access-key.sh` later, if necessary.
2. Create service principal then login: [Docs here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)
    - `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"`
    - `az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID`
3. Set all the azure values in your local environment to allow terraform to authenticate you:

    ```bash
    ARM_CLIENT_ID
    ARM_CLIENT_SECRET
    ARM_SUBSCRIPTION_ID
    ARM_TENANT_ID
    ARM_ACCESS_KEY
    ```

4. if using `kubectl` use this command to connect it with AKS
    - `az aks get-credentials --resource-group [resource-group-name] --name [aks-cluster-name] --admin`

## Github Actions

For the Actions to function properly you will need to set all of the values `ARM_` values as secrets on the repo as well.

## Other Improvements

- Add `terraform apply` to Actions
- Dig deeper into other options that are available to the AKS
  - Load Balancer configs?
