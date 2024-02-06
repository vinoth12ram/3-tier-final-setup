package azure_vm_policy

default deny = true

allow {
    input.resource.type == "azure_compute_virtual_machine"
    input.resource.properties.tags["environment"] == "staging"
}

deny {
    not allow
}
