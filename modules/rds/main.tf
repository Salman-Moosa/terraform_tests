resource "aws_db_subnet_group" "db_subnet" {
  name = "db_subnet"
  subnet_ids =  var.private_subnet_ids 
  tags = {
     Name = "dbsubnet1" 
     }
}

resource "aws_security_group" "sg_grp" {
    vpc_id = var.vpc_id
    ingress  {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [var.ec2_security_group_id]
    }
    egress  {
        from_port = 0
        to_port =0
        protocol ="-1"
        cidr_blocks=["0.0.0.0/0"]

    }
  tags = {
    Name = "security_group_rds1"  
     }
}

resource "aws_db_instance" "db_instance" {
        identifier= "demo-db"
        engine =var.db_engine
        engine_version=var.db_engine_version
        instance_class=var.db_instance_class
        allocated_storage = 20
        db_name=var.db_name
        username=var.db_username
        password=var.db_password
        db_subnet_group_name= aws_db_subnet_group.db_subnet.name
        vpc_security_group_ids= [aws_security_group.sg_grp.id]
        multi_az=var.multi_az
        skip_final_snapshot= true
        
   tags = {
     Name = "dbinstance1"  
     }
}