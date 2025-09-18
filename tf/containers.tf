resource "aws_ecs_cluster" "ecs_cluster" {
    name = "ecs-cluster-container"
}

resource "aws_ecs_task_definition" "ubuntu_task" {
    family                   = "ubuntu-task"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"

    container_definitions = jsonencode([
        {
            name  = "ubuntu-container"
            image = "ubuntu:latest"
            essential = true
            command = ["sleep", "infinity"]
            logConfiguration = {
                logDriver = "awslogs"
                options = {
                    "awslogs-group"        = "/ecs/ubuntu-container"
                    "awslogs-region"       = "eu-central-1"
                    "awslogs-stream-prefix" = "ecs"
                }
            }
        }
    ])
}

resource "aws_ecs_service" "ubuntu_service" {
    name            = "ubuntu-service"
    cluster         = aws_ecs_cluster.ecs_cluster.id
    task_definition = aws_ecs_task_definition.ubuntu_task.arn
    desired_count   = 1
    launch_type     = "FARGATE"

    network_configuration {
        subnets         = [aws_subnet.subnet_spoke_container_private.id]
        security_groups = [aws_security_group.sg_container.id]
        assign_public_ip = false
    }

    depends_on = [aws_ecs_task_definition.ubuntu_task]
}

resource "aws_security_group" "sg_container" {
    name        = "sg-container"
    description = "Allow inbound traffic for container"
    vpc_id      = aws_vpc.vpc_spoke_container.id

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
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