## AZ VM Creation
```az vm create --resource-group diet-fit-rg --name diet-fit-machine-55 --image Ubuntu2204 --vnet-name diet-fit-vnet --subnet diet-fit-subnet --generate-ssh-keys --output json --verbose```

-- --- ---

## Standard Storage Created
``` az storage account create --resource-group diet-fit-rg --name storagefordietfit55 --location eastus --sku Standard_LRS --kind StorageV2 ```
