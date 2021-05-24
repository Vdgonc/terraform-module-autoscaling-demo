# Packer 

Utilizado para buildar uma AMI que suportara a aplicação:


## Utilização

Para utilizar este recurso do projeto é necessario pré configurar algumas variaveis de ambiente antes de executar o comando:

```sh
$ packer build packer.json
```

```sh
# aws access key
export ACCESS_KEY_ID=""

# aws secret key
export SECRET_KEY_ID=""

# região onde serão criados os atefatos
export AWS_REGION=""

# vpc onde sera provisionada a instancia temporaria
export VPC_ID=""

# subnet onde sera provisionada a instancia temporaria
export SUBNET_ID=""

# id de um security group costumizado para receber trafego nas portas de http e https
export SG_ID=""


```


Exemplo:

```json
# packer.json
{
    "variables": {
        "access_key": "{{env `ACCESS_KEY_ID`}}",
        "secret_key": "{{env `SECRET_KEY_ID`}}",
        "aws_region": "{{env `AWS_REGION`}}",
        "vpc_id": "{{env `VPC_ID`}}",
        "subnet_id": "{{env `SUBNET_ID`}}",
        "security_group": "{{env `SG_ID`}}"
    },
    "builders": [
        {
            "type": "amazon-ebs",
            "access_key": "{{user `access_key`}}",
            "secret_key": "{{user `secret_key`}}",
            "region": "{{user `aws_region`}}",
            "vpc_id": "{{user `vpc_id`}}",
            "subnet_id": "{{user `subnet_id`}}",
            "security_group_id": "{{ user `security_group` }}",
            "associate_public_ip_address": true,
            "source_ami_filter": {
                "filters": {
                  "virtualization-type": "hvm",
                  "name": "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*",
                  "root-device-type": "ebs"
                },
                "owners": ["099720109477"],
                "most_recent": true
            },
            "instance_type": "t2.micro",
            "ssh_username": "ubuntu",
            "ami_name": "webserver-linkfree-{{ timestamp }}"
        }
    ],
    "provisioners": [
        {
            "type": "ansible",
            "playbook_file": "./ansible/main.yml"
        }
    ]
}
```