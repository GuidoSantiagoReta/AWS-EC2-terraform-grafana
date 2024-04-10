variable "ami_id" {
  description = "ID de la AMI"
  type        = string
  default     = "ami-0a3c3a20c09d6f377"
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  description = "Asociar dirección IP pública"
  type        = bool
  default     = true
}

variable "instance_tags" {
  description = "Etiquetas para la instancia EC2"
  type        = map(string)
  default     = {
    Name = "PRUEBA" # Reemplazar por el nombre correspondiente
  }
}

# Conexion a Grafana para levantarlo desde EC2 consola AWS

 resource "aws_instance" "grafana_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.instance_security_group.id]
  key_name                    = aws_key_pair.ec2-server-ssh-key.key_name

  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = "Grafana-Instance" # Nombre para la instancia de Grafana
  }
}   
