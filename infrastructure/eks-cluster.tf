
// creating cluster

resource "aws_eks_cluster" "eks-cluster" {
  name     = "Cluster-01"
  role_arn = aws_iam_role.eks-cluster-role.arn
  vpc_config {
    subnet_ids = [
      aws_subnet.eks-subnets1.id,
      aws_subnet.eks-subnets2.id,
      aws_subnet.eks-subnets3.id,
      aws_subnet.eks-subnets4.id
    ]
    security_group_ids      = [aws_security_group.eks-sg.id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
  tags = {
    environment = "dev"
    application = "app"
  }



  depends_on = [aws_iam_role_policy_attachment.eks-cluster-role-AmazonEKSClusterPolicy]
}

// worker node group creation
resource "aws_eks_node_group" "eks-node-grp" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "Node-group-01"
  node_role_arn   = aws_iam_role.eks-node-role.arn

  scaling_config {
    desired_size = 3
    max_size     = 4
    min_size     = 3
  }

  remote_access {
    ec2_ssh_key               = var.ssh_key_name
    source_security_group_ids = []
  }

  subnet_ids = [
    aws_subnet.eks-subnets1.id,
    aws_subnet.eks-subnets2.id,
    aws_subnet.eks-subnets3.id,
    aws_subnet.eks-subnets4.id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = [var.node-instance-type]


  update_config {
    max_unavailable = 2
  }

  labels = {
    role = "general"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-node-role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-node-role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-node-role-AmazonEC2ContainerRegistryReadOnly,
  ]
}
