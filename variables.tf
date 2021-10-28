variable "VM_Subnet_Map" {
  type        = list(any)
  description = "list of VM name and subnet space"
  default = [
    {
      "VM_Name"      = "macro-life-VM1",
      "Subnet_Space" = "10.0.1.0/24"
    },
    {
      "VM_Name"      = "macro-life-VM2",
      "Subnet_Space" = "10.0.2.0/24"
    }
  ]
}
