variable "ig_rules" {
    type = list(object(
        {
            description = string
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = list(string)
        }
    ))
    default = [
        {
            description = "SSH Access"
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["172.32.0.0/0"]
        },
        {
            description = "HTTP Access"
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            description = "HTTPs Access"
            from_port = 443
            to_port = 443
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]
}