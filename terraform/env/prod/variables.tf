variable "environment" {
  description = "The environment in which the RDS instance will be deployed"
  type        = string
  nullable = false
  validation {
    condition     = can(regex("^[a-z0-9_]+$", var.environment))
    error_message = "The environment name must be a lowercase string with no spaces"
  }
}

## RDS module variables
variable "rds_subnet_group_name" {
  description = "The name of the RDS subnet group to use for the RDS module"
  type        = string
}

variable "rds_security_group_ids" {
  description = "The IDs of the security groups associated with the RDS module"
  type        = set(string)
}
