variable "alarmist_address" {}
variable "alarmist_short_name" {}

variable "alarmist_path" {
  default = "/"
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

resource "aws_route53_health_check" "r53_healthcheck" {
  fqdn              = "${var.alarmist_address}"
  port              = 443
  type              = "HTTPS"
  failure_threshold = "3"
  request_interval  = "30"
  measure_latency   = true
  resource_path     = "${var.alarmist_path}"

  tags = {
    Name = "${var.alarmist_short_name} - HealthCheck by Alarmist"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  provider            = "aws.use1"
  alarm_name          = "alarmist-for-${var.alarmist_short_name}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1"
  alarm_description   = "This check monitors ${var.alarmist_address}."

  dimensions = {
    HealthCheckId = "${aws_route53_health_check.r53_healthcheck.id}"
  }
}
