resource "aws_launch_template" "dashboard_asg_template" {
  name          = "dashboard-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow_http_asg.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "emp-dashboard"
    }
  }

  user_data = filebase64("${path.module}/user_data.sh")
}