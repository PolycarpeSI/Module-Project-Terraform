module "key" {
  source      = "../key-pair"
  region-name = "us-east-1"
  key-name    = "module-key2"
}