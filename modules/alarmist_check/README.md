# Alarmist

A module to build cloudwatch alarms and route53 health checks.


# Usage
For each monitor you want to configure, add the following:

```
module "appdotoptimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "app.optimizely.com"
  alarmist_short_name = "app_opt"
}
```

If you need to add a path to the url, for example, `/ping` you can do so like this:

```
module "appdotoptimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "app.optimizely.com"
  alarmist_short_name = "app_opt"
  alarmist_path       = "/ping"
}
```