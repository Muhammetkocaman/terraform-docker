resource "aws_instance" "docker_host" {
  ami                    = var.ami_id          # Amazon Linux 2 AMI olmalı
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker_sg.id]  # 22 ve 80'e izin veren SG
    key_name               = "muhammet-key2"

 user_data = <<-EOF
#!/bin/bash
sudo dnf update -y
sudo dnf install -y docker
sudo systemctl enable --now docker

sudo docker rm -f nginx || true
sudo docker run -d --name nginx -p 80:80 nginx
EOF

  tags = {
    Name = "terraform-docker-host"
  }
}