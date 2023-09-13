
data "terraform_remote_state" "iam" {
  backend = "s3" # Use the appropriate backend and configuration
  config = {
    bucket         = "terraform-state-devopsthehardway-rf"
    key            = "eks-terraform-IAM-roles.tfstate"
    region         = "us-east-1" # Specify the appropriate region
    encrypt        = true
  }
}

## Create the EKS cluster
resource "aws_eks_cluster" "devopsthehardway-eks" {
  name = "devopsthehardway-cluster"
  role_arn = data.terraform_remote_state.iam.outputs.eks_cluster_role_arn

  vpc_config {
    subnet_ids = [var.subnet_id_1, var.subnet_id_2]
  }

  # depends_on = [
  #   aws_iam_role.eks-iam-role,
  # ]
}



resource "aws_eks_node_group" "worker-node-group" {
  cluster_name    = aws_eks_cluster.devopsthehardway-eks.name
  node_group_name = "devopsthehardway-workernodes"
  node_role_arn   = data.terraform_remote_state.iam.outputs.eks_worker_nodes_arn
  subnet_ids      = [var.subnet_id_1, var.subnet_id_2]
  instance_types = ["t3.xlarge"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # depends_on = [
  #   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
  #   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
  #   #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  # ]
}