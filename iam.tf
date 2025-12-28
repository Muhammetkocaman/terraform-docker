# 1. öncelikle rol oluşturuyoruz.
resource "aws_iam_role" "ec2_s3_access_role" {
  name = "muhammet-ec2-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# 2. yetkilerini veriyoruz.
resource "aws_iam_role_policy" "s3_access_policy" {
  name = "muhammet-s3-write-policy"
  role = aws_iam_role.ec2_s3_access_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # 1. ls ile test edebilmek için 
        Action   = ["s3:ListAllMyBuckets"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = ["s3:PutObject", "s3:ListBucket", "s3:GetObject"]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::terraform-docker-muhammet-002",
          "arn:aws:s3:::terraform-docker-muhammet-002/*"
        ]
      }
    ]
  })
}

# 3.ec2de kullanabilmek için kimlik kartı gibi yapıyoruz.

resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "muhammet-ec2-s3-instance-profile"
  role = aws_iam_role.ec2_s3_access_role.name
}

#Not: BU KISMI TEKRAR BİR DAHA ÇALIŞ.