variable "alarmist_address" {}
variable "alarmist_short_name" {}

variable "alarmist_path" {
  default = "/"
}

variable "alarmist_action_arns" {
  type        = "string"
  description = "Comma seperated list of arns to action on when moved to failed state."
  default     = ""
}

variable "alarmist_protocol" {
  type        = "string"
  description = "HTTP or HTTPS check"
  default     = "HTTPS"
}
