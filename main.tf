provider "aws" {
  region = "us-east-1"
}

module "appdotoptimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "app.optimizely.com"
  alarmist_short_name = "app_opt"
}

module "reference_snippet" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "cdn.optimizely.com"
  alarmist_short_name = "ref_snip"
  alarmist_path       = "/js/9253108584.js"
}

module "www_optimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "www.optimizely.com"
  alarmist_short_name = "www_opt"
}

module "teams_optimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "teams.optimizely.com"
  alarmist_short_name = "teams_opt"
}

module "tapi_optimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "tapi.optimizely.com"
  alarmist_short_name = "tapi_opt"
  alarmist_path       = "/ping"
}

module "api_optimizely" {
  source              = "./modules/alarmist_check"
  alarmist_address    = "api.optimizely.com"
  alarmist_short_name = "api_opt"
  alarmist_path       = "/health"
}
