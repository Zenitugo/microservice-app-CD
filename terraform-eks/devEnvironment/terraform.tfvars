cidr_block                  = "10.20.0.0/16"  
region                      = "eu-west-1"
private-subnets             = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"] 
public-subnets              = ["10.20.4.0/24", "10.20.5.0/24", "10.20.6.0/24"]
cluster                     = "mycluster"
node-group                  = "mynodes"
instance_type               = "t2.medium"  
key_name                    = "eks-key"
cluster-rolename            = "my-cluster-role" 
node-role-name              = "my-worker-node" 
key_filename                = "/home/ubuntu/.ssh/id_rsa"
sg-name                     = "eks-sg"
addon_name                  = "aws-ebs-csi-driver-addon"
role_name                   = "aws-ebs-csi-driver"