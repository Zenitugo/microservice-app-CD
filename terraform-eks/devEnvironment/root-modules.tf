module "vpc" {
    source                   = "../childmodules/vpc"
    cidr_block               = var.cidr_block  
    public-subnets           = var.public-subnets
    private-subnets          = var.private-subnets 
}




module "eks" {
    source                  = "../childmodules/eks"
    cluster                 = var.cluster
    eks-cluster-role        = module.iam.eks-cluster-role
    private-subnet-ids      = module.vpc.private-subnet-ids 
    node-group              = var.node-group
    node-role               = module.iam.node-role
    eks-sg                  = module.SG.eks-sg
    instance_type           = var.instance_type 
    key_name                = var.key_name
    cluster-policy          = module.iam.cluster-policy
    WorkerPolicy            = module.iam.WorkerPolicy
    CNIPolicy               = module.iam.CNIPolicy
    ContainerRegistry       = module.iam.ContainerRegistry  
    public-subnet-ids       = module.vpc.public-subnet-ids
    key-id                  = module.keys.key-id   
}


module "SG" {
    source                  = "../childmodules/SG"
    vpc-id                  = module.vpc.vpc-id
    sg-name                 = var.sg-name 
}



module "iam" {
    source                  = "../childmodules/iam"
    cluster-rolename        = var.cluster-rolename 
    node-role-name          = var.node-role-name 
}



module "keys" {
    source                  = "../childmodules/keys"
    key_filename            = var.key_filename
    key_name                = var.key_name
}