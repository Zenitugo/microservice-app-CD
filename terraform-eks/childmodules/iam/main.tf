# Create an IAM role for the EKS cluster
resource "aws_iam_role" "eks-role" {
    name                       = var.cluster-rolename
    assume_role_policy         = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": [
                        "eks.amazonaws.com"
                    ]
                },
                "Action": "sts:AssumeRole"
            }
        ]
    })
}
################################################################################################
################################################################################################

# Attach iam role to eks cluster policy
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn                    = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role                          = aws_iam_role.eks-role.name
}
################################################################################################
################################################################################################

# Create an IAM role for EKS worker nodes
resource "aws_iam_role" "worker-node-role" {
    name                          = var.node-role-name
    assume_role_policy            = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": [
                        "ec2.amazonaws.com"
                    ]
                },
                "Action": "sts:AssumeRole"
            }
        ]
    })

}
################################################################################################
################################################################################################

# Attach the IAM policies to the EKS worker nodes
resource "aws_iam_role_policy_attachment" "WorkerPolicy" {
  policy_arn                      = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role                            = aws_iam_role.worker-node-role.name
}

resource "aws_iam_role_policy_attachment" "CNIPolicy" {
  policy_arn                      = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role                            = aws_iam_role.worker-node-role.name
}

resource "aws_iam_role_policy_attachment" "ContainerRegistry" {
  policy_arn                      = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role                            = aws_iam_role.worker-node-role.name
}

#####################################################################################################
#####################################################################################################

# IAM role for csi drive addon
resource "aws_iam_role" "eks_ebs_csi_driver" {
  assume_role_policy              = data.aws_iam_policy_document.csi.json
  name                            = var.role_name
}

#Policy attachemet to iam role addon
resource "aws_iam_role_policy_attachment" "amazon_ebs_csi_driver" {
  role                            = aws_iam_role.eks_ebs_csi_driver.name
  policy_arn                      = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}
