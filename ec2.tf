provider "aws" {
  region                   = "ap-southeast-1"
  shared_credentials_file  = "/environment/credentials"
  profile                  = "default"
}

# Do it for Linux & Windows

resource "aws_instance" "sample" {
    #ami = "ami-0103cd62"
    ami = "ami-92be77f1"
    instance_type = "t2.micro"
    key_name = "saikat-sg2"
    tags {
        Name = "bt-terraform"
    }
/*
    ebs_block_device {
        device_name = "/dev/sdb"
        delete_on_termination = true
        encrypted = true
        volume_size = 2Gb
    }
    */
}
