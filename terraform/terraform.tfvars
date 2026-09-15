aws_region = "us-east-1"

environment = "production"

project_name = "devsecops-cicd"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

eks_cluster_version = "1.31"

eks_node_instance_type = "t3.medium"

eks_desired_nodes = 2

eks_min_nodes = 2

eks_max_nodes = 4
