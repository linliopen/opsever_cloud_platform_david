resource "aws_alb" "opsever_alb" {
  name               = "${local.prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.opsever_alb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  idle_timeout       = 600

  enable_deletion_protection = false
}

resource "aws_alb_listener" "opsever_alb_listener" {
  load_balancer_arn = aws_alb.opsever_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "application/json"
      status_code  = "404"
      message_body = local.error_message_json
    }
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_alb_listener.opsever_alb_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.opsever_alb_target_group.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

resource "aws_lb_target_group" "opsever_alb_target_group" {
  name        = "${local.prefix}-target-group"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"

  vpc_id = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "opsever_alb_target_group_instance_1_attachment" {
  target_group_arn = aws_lb_target_group.opsever_alb_target_group.arn
  target_id        = aws_instance.opsever_instance_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "opsever_alb_target_group_instance_2_attachment" {
  target_group_arn = aws_lb_target_group.opsever_alb_target_group.arn
  target_id        = aws_instance.opsever_instance_2.id
  port             = 80
}