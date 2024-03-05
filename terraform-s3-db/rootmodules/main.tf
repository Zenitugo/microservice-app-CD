module "s3" {
    source                   = "../childmodules/s3"
    bucket                   = var.bucket 
}

module "dynamoDB" {
    source                  = "../childmodules/dynamodb"
    db-name                 = var.db-name
    billing_mode            = var.billing_mode
    type                    = var.type
    hash_key                = var.hash_key   
}