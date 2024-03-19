variable "project_id" {
  type        = string
  description = "The ID of the project where resources will be created."
}

variable "region" {
  type        = string
  description = "The region where resources will be created."
}

variable "env" {
  type = map(string)
  default = {}
}

variable "ent_terraform" {
  description = "O nome do bucket para os esquemas"
  type        = string
  default     = "entrada_terraform"
}

variable "schema_bucket" {
  description = "O nome do bucket para os esquemas"
  type        = string
  default     = "entrada_schema_bucket"
}

variable "entrada_manual" {
  description = "O nome do bucket para entrada manual"
  type        = string
  default     = "entrada_manual"
}

variable "entrada_auto" {
  description = "O nome do bucket para entrada automática"
  type        = string
  default     = "entrada_auto"
}
