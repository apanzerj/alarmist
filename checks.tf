module "appdotoptimizely" {
  source              = "./modules"
  alarmist_address    = "app.optimizely.com"
  alarmist_short_name = "app_opt"
}

module "reference_snippet" {
  source              = "./modules"
  alarmist_address    = "cdn.optimizely.com"
  alarmist_short_name = "ref_snip"
  alarmist_path       = "/js/9253108584.js"
}

module "www_optimizely" {
  source              = "./modules"
  alarmist_address    = "www.optimizely.com"
  alarmist_short_name = "www_opt"
}

module "teams_optimizely" {
  source              = "./modules"
  alarmist_address    = "teams.optimizely.com"
  alarmist_short_name = "teams_opt"
}

module "logx_optimizely" {
  source              = "./modules"
  alarmist_address    = "logx.optimizely.com"
  alarmist_short_name = "logx_opt"
}

module "tapi_optimizely" {
  source              = "./modules"
  alarmist_address    = "tapi.optimizely.com"
  alarmist_short_name = "tapi_opt"
  alarmist_path       = "/ping"
}

module "api_optimizely" {
  source              = "./modules"
  alarmist_address    = "api.optimizely.com"
  alarmist_short_name = "api_opt"
  alarmist_path       = "/health"
}
