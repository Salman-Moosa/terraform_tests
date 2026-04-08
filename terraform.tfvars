default_region = "us-east-1"
# default_ami="ami-02dfbd4ff395f2a1b"
# default_instance_type="t2.micro"

instances = {
  "web" = { ami = "ami-02dfbd4ff395f2a1b", instance_type = "t2.micro" }
  "api" = { ami = "ami-02dfbd4ff395f2a1b", instance_type = "t2.micro" }
}