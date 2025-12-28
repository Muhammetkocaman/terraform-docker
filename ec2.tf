resource "aws_instance" "docker_host" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [module.aws_security_group.sg_id]
  key_name               = "muhammet-key2"
  
  user_data = <<-EOF
#!/bin/bash
echo "Docker + Nginx installed by user_data at $(date)" >> /home/ec2-user/bootstrap.log
sudo dnf update -y
sudo docker run -d --name whoami -p 8080:80 containous/whoami
sudo dnf install -y docker
sudo systemctl enable --now docker

sudo docker rm -f nginx || true
sudo docker run -d --name nginx -p 80:80 nginx
EOF

  tags = {
    Name = "terraform-docker-host"
  }


  iam_instance_profile = aws_iam_instance_profile.ec2_s3_profile.name

}