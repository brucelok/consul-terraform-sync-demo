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
