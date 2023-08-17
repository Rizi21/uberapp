resource "aws_security_group" "control_plane_security_group" {
  name        = "ControlPlaneSecurityGroup"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.vpc.id
}
