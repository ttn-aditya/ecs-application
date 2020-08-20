resource "aws_ecs_task_definition" "Cactus-sample-definition" {
    family                = "Cactus-sample-definition"
    container_definitions = "${file("./ecs/task-definition.json")}"
}