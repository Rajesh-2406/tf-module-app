resource "aws_security_group" "main" {
  name        = "${var.component}-${var.env}-sg"
  description = "${var.component}-${var.env}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = var.sg_subnet_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "${var.component}-${var.env}-sg"
  }
}

resource "aws_lanch_template" "main" {
  name = "${var.component}-${var.env}"

  iam_instance_profile {
    name = aws_iam_instance_profile.instance_profile.name
  }
  image_id = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.main.id]

tag specifications {
  resource_type = "instance"
  tags = merge({ Name = "${var.component}-${var.env}", Monitor ="true"}, var.tags)
}

user_data = base64encode(templatefile("${path.module}/userdata.sh", {
      env = var.env
      component = var.component
    }))
    }

resource "aws_autoscalling_group" "main" {
  desired_capacity = var.desired_capacity
  max_size  = var.max_size
  min_size = var.min_size
}