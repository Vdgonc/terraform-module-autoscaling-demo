 # terraform-module-autoscaling-demo

 ---

 Demonstração de deploy de uma aplicação web utilizando [terraform-module-autoscaling](https://github.com/Vdgonc/terraform-module-autoscaling).

 ## Demo
---

 ![demo](docs/img/demo.gif)

## Descrição

Neste projeto foi o utilizado o conceito de infraestrutura imutável. Com o [Ansible](https://www.ansible.com/) é configurado a instância para suportar a [aplicação](https://github.com/MichaelBarney/LinkFree) e o [Packer](https://www.packer.io/) faz o build de uma AMI utilizando o playbook.

Com o [Terraform]() é provisionado a infraestrutura utilizando o módulo `https://github.com/Vdgonc/terraform-module-autoscaling` e assim que a instância estiver disponível é feito o registro de subdominío no [Route 53](https://aws.amazon.com/pt/route53/).