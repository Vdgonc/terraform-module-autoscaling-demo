module "asg" {
    source = "git@github.com:Vdgonc/terraform-module-autoscaling.git"

    name = "webserver"
    key_name = "vdgonc"
    vpc_id = "vpc-abcabcbabc"

    ami_owner = "self"
    ami_name = "webserver-linkfree-*"

    use_user_data = true
    user_data_path = "user-data.sh"
    sns_email = "teste@teste.com"

    min_size = 1
    max_size = 1
    desired_capacity = 1

    ingress_rules = var.ig_rules
    cw_config_file = "cw_agent_config.json"
}

