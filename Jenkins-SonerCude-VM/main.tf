resource "aws_instance" "web" {
    ami          = var.ubuntu_ami 
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.Jenkins-VM-SG.id]
    user_data              = templatefile("./install.sh", {})

    tags = {
        Name = "Jenkins-VM"
    }

    root_block_device {
        volume_size = 30
    }
}

resource "aws_security_group" "Jenkins-VM-SG" {
    name        = "Jenkins-VM-SG"
    description = "Allow inbound traffic"

    ingress = [
        for port in var.ports:
        {
            description = "Allow port ${port}"
            from_port   = port
            to_port     = port
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }

    ]

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Jenkins-VM-SG"
    }
}