VPC_cidr     = "10.0.0.0/16"

AZ1          = "us-east-1a"
AZ2          = "us-east-1b"
AZ3          = "us-east-1c"

subnet1_cidr = "10.0.1.0/24"
subnet2_cidr = "10.0.2.0/24"
subnet3_cidr = "10.0.3.0/24" 


instance_type    = "t2.micro"
instance_class   = "db.t2.micro"


database_name           = "wordpress_db"
database_user           = "wordpress_user"
database_password       = "123456789"

ami                     = "ami-08d4ac5b634553e16"
keypair                 = "Mykeypair" 