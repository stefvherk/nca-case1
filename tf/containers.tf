resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster-container"
}

resource "aws_ecs_task_definition" "nginx_task" {
  family                   = "nginx-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "nginx-container"
      image     = "nginx:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_nginx_container.name
          "awslogs-region"        = "eu-central-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "nginx_service" {
  name                   = "nginx-service"
  cluster                = aws_ecs_cluster.ecs_cluster.id
  task_definition        = aws_ecs_task_definition.nginx_task.arn
  desired_count          = 1
  launch_type            = "FARGATE"
  enable_execute_command = true

  network_configuration {
    subnets          = [aws_subnet.subnet_container_private.id]
    security_groups  = [aws_security_group.sg_container.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.nginx_tg.arn
    container_name   = "nginx-container"
    container_port   = 80
  }

  depends_on = [aws_ecs_task_definition.nginx_task]
}


resource "aws_security_group" "sg_container" {
  name        = "securitygroup-container"
  description = "Allow inbound traffic from ALB only"
  vpc_id      = aws_vpc.vpc_hub.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SG-Container"
  }
}

resource "aws_security_group_rule" "ssm_inbound" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.sg_container.id
  source_security_group_id = aws_security_group.sg_container.id
}

resource "aws_cloudwatch_log_group" "ecs_nginx_container" {
  name              = "/ecs/nginx-container"
  retention_in_days = 7

  tags = {
    Name = "ECS-Nginx-Container-Logs"
  }
}