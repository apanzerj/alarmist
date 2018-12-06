provider "aws" {
  region = "us-east-1"
}

resource "aws_sns_topic" "message_queue" {
  name = "alarmist_message_queue"
}

module "appdotoptimizely" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "app.optimizely.com"
  alarmist_short_name  = "app_opt"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

module "reference_snippet" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "cdn.optimizely.com"
  alarmist_short_name  = "ref_snip"
  alarmist_path        = "/js/9253108584.js"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

module "www_optimizely" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "www.optimizely.com"
  alarmist_short_name  = "www_opt"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

module "teams_optimizely" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "teams.optimizely.com"
  alarmist_short_name  = "teams_opt"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

module "tapi_optimizely" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "tapi.optimizely.com"
  alarmist_short_name  = "tapi_opt"
  alarmist_path        = "/ping"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

module "api_optimizely" {
  source               = "./modules/alarmist_check"
  alarmist_address     = "api.optimizely.com"
  alarmist_short_name  = "api_opt"
  alarmist_path        = "/health"
  alarmist_action_arns = "${aws_sns_topic.message_queue.arn}"
}

