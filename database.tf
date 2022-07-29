resource "aws_db_subnet_group" "RDS_subnet_grp" {
  subnet_ids = ["${aws_subnet.subnet-private-1.id}", "${aws_subnet.subnet-private-2.id}"]
}

resource "aws_db_instance" "wordpressdb" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.instance_class
  db_subnet_group_name   = aws_db_subnet_group.RDS_subnet_grp.id
  vpc_security_group_ids = ["${aws_security_group.RDS_sg.id}"]
  name                   = var.database_name
  username               = var.database_user
  password               = var.database_password
  skip_final_snapshot    = true
}
