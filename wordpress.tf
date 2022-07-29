data "template_file" "user_data" {
  template = file("./userdata.tpl")
  vars = {
    db_username      = var.database_user
    db_user_password = var.database_password
    db_name          = var.database_name
    db_RDS           = aws_db_instance.wordpressdb.endpoint
  }
}


# Create EC2 ( only after RDS is provisioned)
resource "aws_instance" "wordpressec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet-public-1.id
  vpc_security_group_ids = ["${aws_security_group.webserver.id}"]
  user_data              = data.template_file.user_data.rendered
  key_name               = var.keypair
  tags = {
    Name = "Wordpress.web"
  }

  depends_on = [aws_db_instance.wordpressdb]
}