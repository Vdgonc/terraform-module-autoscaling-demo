output "launch_template_id" {
    value = module.asg.launch_template_id
}

output "autoscaling_group_name" {
    value = module.asg.asg_name
}

output "autoscaling_group_arn" {
    value = module.asg.asg_arn
}

output "security_group_id" {
    value = module.asg.sg_id
}

output "security_group_name" {
    value = module.asg.sg_name
}

output "sns_topic" {
    value = module.asg.sns_topic
}

output "sns_topic_arn" {
    value = module.asg.sns_topic_arn
}