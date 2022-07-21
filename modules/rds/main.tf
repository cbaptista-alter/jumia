resource "aws_db_instance" "default" {
  depends_on = [
    aws_db_subnet_group.default
  ]
  allocated_storage    = 5
  db_subnet_group_name = var.db_subnet_group_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.instance_class
  identifier           = base64decode(var.identifier)
  db_name              = base64decode(var.db_name)
  username             = base64decode(var.master_username)
  password             = base64decode(var.master_password)
  # parameter_group_name = "default"
  skip_final_snapshot    = true
  vpc_security_group_ids = var.db_security_groups
}

resource "aws_db_subnet_group" "default" {
  name       = "jumia-private-subnet-group"
  subnet_ids = ["subnet-07b8db5e827115802", "subnet-02e76b60429cdc87a","subnet-095f3452c2a7a5f3a","subnet-08c2c5065c4c63b36"]

}