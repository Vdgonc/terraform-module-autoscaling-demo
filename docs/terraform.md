# Terraform

Utilizando modulo para provisionar uma aplicação similar ao LinkTree.


## Utilização

```sh
terraform init
terraform workspace new prod
terraform plan 
terraform apply

# para destruir ambiente
terraform destroy

```


Exemplo:

```hcl
# main.tf
# workspace: prod

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

```


## Variaveis

### name
Nome que indicara recursos criados pelo terraform.

Instancias: webserver

AutoScaling Group: webserver-asg-prod

### key_name

Nome da chave para conexão SSH.

### vpc_id

VPC para provisionar o ambiente.

### ami_owner

Conta proprietaria da AMI utilizada no launch template.

### ami_name

Nome da AMI utilizada no launch template, pode-se usar caracteres coringas para filtragem.

### use_user_data

Habilita o uso de user-data ao inicio de cada instancia

### user_data_path

Caminho para o script de user-data.

### sns_email

Email para notificações dos alertas no CloudWatch.

### min_size

Numero minimo de instancias no autoscaling.

### max_size

Numero maximo de instancias no autoscaling.

### desired_capacity

Numero desejado de instancias de instancias no autoscaling.

### ingress_rules

Regras de entrada no security group.
