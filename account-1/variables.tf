variable "project_owner" {
  type        = string
  description = "A simple project owner name"
  default     = ""
}
variable "project_name" {
  type        = string
  description = "A simple name for a project"
  default     = "codepipeline-example"
}
variable "region" {
  type        = string
  description = "The region you would like to deploy your code to"
  default     = "ap-southeast-2"
}
