# ---------- Listing 2.3 ----------

resource "aws_instance" "web" {
  count                       = var.web_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.web_sg_id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf install -y httpd || yum install -y httpd
              systemctl enable --now httpd
              echo "web-${count.index + 1}" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-${count.index + 1}"
    Tier = "web"
  }
}

# Only references the SG (via var.db_sg_id, which the root module derives
# from module.network) — it does NOT depend_on the web instances, which is
# why Output 2.1 shows web[] and db creating in parallel, not in sequence.
resource "aws_instance" "db" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.private_subnet_id
  vpc_security_group_ids  = [var.db_sg_id]
  key_name                = var.key_name

  tags = {
    Name = "db"
    Tier = "db"
  }
}
