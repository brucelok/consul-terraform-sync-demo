log_level = "DEBUG"

consul {
  address = "localhost:8500"
}

task {
  name        = "route53-dns-sync"
  description = "Sync api services to Route53"
  module      = "./modules/route53-sync"
  condition "services" {
    names = ["api"]
  }
  providers   = ["aws"]
}

task {
  name        = "sg-ip-sync"
  description = "Sync allowed CIDRs from Consul KV to AWS Security Group ingress rules"
  module      = "./modules/secgroup-sync"
  condition "consul-kv" {
    path    = "security/allowed"
    recurse = true
    use_as_module_input = true
  }
  providers   = ["aws"]
}
