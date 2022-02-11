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
    git_commit           = "a538ff298daa73b73a9f59704c71ed08f2163fe1"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-11 19:05:58"
    git_last_modified_by = "denismalkomail@gmail.com"
    git_modifiers        = "denismalkomail"
    git_org              = "d-malko"
    git_repo             = "terragoat"
    yor_trace            = "2f906103-5e65-4c4a-9ea1-d950d3992f3b"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "a538ff298daa73b73a9f59704c71ed08f2163fe1"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-02-11 19:05:58"
    git_last_modified_by = "denismalkomail@gmail.com"
    git_modifiers        = "denismalkomail"
    git_org              = "d-malko"
    git_repo             = "terragoat"
    yor_trace            = "11eca2f5-1d46-4d83-bf5b-fcabf6adff40"
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
