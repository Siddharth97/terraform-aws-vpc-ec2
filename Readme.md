Terraform AWS VPC & EC2 Challenge

This Terraform project sets up a basic AWS network with public and private subnets and EC2 instances.
### Architecture
	•	VPC: Custom CIDR with DNS support.
	•	Subnets: 3 public (IGW) + 3 private (no internet).
	•	Internet Gateway: For public subnet internet access.
	•	Route Tables: Public routes via IGW; private has no internet route.
	•	Security Group: Allows HTTP inbound, all outbound.
	•	EC2 Instances: 3 public (with public IPs) + 3 private (no public IPs).

### Prerequisites
	•	Terraform >= 1.5.0
	•	AWS CLI with proper credentials
	•	Key pair for EC2


### Usage (inputs already given as defaults)
```bash
terraform init
terraform plan 
terraform apply 
terraform destroy 
```

### Module Structure
	•	modules/vpc – VPC, subnets, IGW, route tables
	•	modules/ec2 – Security group and EC2 instances

### Outputs
	•	vpc_id, public_subnets, private_subnets
