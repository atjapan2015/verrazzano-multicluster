output "ssh_to_admin_operator" {
  description = "convenient command to ssh to the Admin operator host"
  value       = module.vadmin.ssh_to_operator
}

output "ssh_to_au_operator" {
  description = "convenient command to ssh to the Sydney operator host"
  value       = module.vicn.ssh_to_operator
}

output "ssh_to_in_operator" {
  description = "convenient command to ssh to the Mumbai operator host"
  value       = module.vkix.ssh_to_operator
}

output "ssh_to_jp_operator" {
  description = "convenient command to ssh to the Tokyo operator host"
  value       = module.vyny.ssh_to_operator
}
