# alarmist
Monitoring using Route53 HealthChecks and Cloudwatch alarms


This uses Terraform to create basic Route53 HealthChecks and Cloudwatch alarms. See here for how to run Terraform at Optimizely: https://github.com/optimizely/backend-chef/tree/master/infra

Currently the alarms are created in AWS DevOps. The Cloudwatch alarm console is here: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#alarm:alarmFilter=ANY

Once created, these health checks can be graphed into Datadog like so: https://app.datadoghq.com/dash/833770/optimizely-slo-timeboard
