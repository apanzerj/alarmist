resource "aws_route53_health_check" "r53_healthcheck" {
  fqdn              = "${var.alarmist_address}"
  port              = "${var.alarmist_protocol == "HTTP" ? 80 : 443}"
  type              = "${var.alarmist_protocol}"
  failure_threshold = "3"
  request_interval  = "30"
  measure_latency   = true
  resource_path     = "${var.alarmist_path}"

  tags = {
    Name = "${var.alarmist_short_name} - HealthCheck by Alarmist"
  }
}

resource "aws_cloudwatch_metric_alarm" "alarm" {
  alarm_name          = "alarmist-for-${var.alarmist_short_name}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = "60"
  statistic           = "Minimum"
  threshold           = "1"
  alarm_description   = "This check monitors ${var.alarmist_address}."
  alarm_actions       = ["${split(",", var.alarmist_action_arns)}"]

  dimensions = {
    HealthCheckId = "${aws_route53_health_check.r53_healthcheck.id}"
  }
}
