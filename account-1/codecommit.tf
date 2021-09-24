resource "aws_codecommit_repository" "pipeline" {
  repository_name = "${var.project_name}-pipeline"
  default_branch  = "master"
}

output "codecommit_clone" {
  value = "git clone codecommit::${var.region}://${var.project_name}-pipeline"
}
