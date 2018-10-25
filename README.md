# alarmist
Monitoring using Route53 HealthChecks and Cloudwatch alarms


To update this:

1. `terraform init`
2. `terraform plan -out someplanname`
3. `terraform apply someplanname`

See module details for parameters and information.

Currently the alarms are created in AWS DevOps. The Cloudwatch alarm console is here: https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#alarm:alarmFilter=ANY

Once created, these health checks can be graphed into Datadog like so: https://app.datadoghq.com/dash/833770/optimizely-slo-timeboard
