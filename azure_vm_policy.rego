package main

default allow = false

# Rule to allow VMs with the specified tags
allow {
    input.resourceType == "Microsoft.Compute/virtualMachines"
}

# Deny rule for VMs that do not meet the tag criteria

deny[msg] {
    input.resourceType == "Microsoft.Compute/virtualMachines"
    input.properties.hardwareProfile.vmSize != "Standard_B2ms"
    msg := sprintf("VM size '%s' is not allowed", [input.properties.hardwareProfile.vmSize])
}

deny[msg] {
    input.resourceType == "Microsoft.Compute/virtualMachines"
    input.properties.resourceGroup != "DOJO"
    msg := "VM creation is only allowed in 'my-resource-group' resource group"
}

