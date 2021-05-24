provider "aws" {
    region = "us-east-2"
}

data "aws_instances" "instances" {
    depends_on = [
      module.asg
    ]
    instance_tags = {
        Name = "webserver",
        Environment = terraform.workspace
    }

    filter {
        name = "instance.group-id"
        values = [ module.asg.sg_id ]
    }

    instance_state_names = [ "running" ]
}


data "aws_route53_zone" "zone" {
    name = "vdgonc.com"
}

resource "aws_route53_record" "dns" {
    zone_id = data.aws_route53_zone.zone.zone_id
    name = "lab.vdgonc.com"
    type = "A"
    ttl = "60"
    records = data.aws_instances.instances.public_ips
}


output "public_ips" {
    value = data.aws_instances.instances.public_ips
}

output "route53_record" {
    value = aws_route53_record.dns.name
}
