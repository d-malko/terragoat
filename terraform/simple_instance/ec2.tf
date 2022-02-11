provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "23979b1e42f1839310806b38dbef88a768569c29"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-11 19:03:19"
    git_last_modified_by = "denismalkomail@gmail.com"
    git_modifiers        = "denismalkomail"
    git_org              = "d-malko"
    git_repo             = "terragoat"
    yor_trace            = "e4759248-6630-4dab-95ea-a5879ba93c58"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "23979b1e42f1839310806b38dbef88a768569c29"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-11 19:03:19"
    git_last_modified_by = "denismalkomail@gmail.com"
    git_modifiers        = "denismalkomail"
    git_org              = "d-malko"
    git_repo             = "terragoat"
    yor_trace            = "77f88b1b-6e54-439f-a795-6080b11a63ae"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
