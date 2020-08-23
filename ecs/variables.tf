
variable "ecs-target-group-arn" {}

variable "ecs-cluster-name" {
    default = "Cactus-ecs-cluster"
}

variable "ecs-service-role-arn" {
    default = "Cactus-ecs-cluster"
}

variable "ecs-service-name" {
    default = "Cactus-ecs-service"
}

variable "ecs-load-balancer-name" {
    default = "Cactus-ecs-load-balancer"
}

