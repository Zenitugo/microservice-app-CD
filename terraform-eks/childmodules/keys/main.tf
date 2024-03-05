# Create Key pair
resource "aws_key_pair" "key-pair" {
    key_name = var.key_name
    public_key = tls_private_key.ssh_key.public_key_openssh
}

# Create a Private key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Put the private key in a local file
resource "local_file" "private-file" {
  content = tls_private_key.ssh_key.private_key_pem
  filename = var.key_filename
}
