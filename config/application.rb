require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "active_storage/engine"

Bundler.require(*Rails.groups)

module Njor
  class Application < Rails::Application
    config.load_defaults 6.0
    config.api_only = true
    config.generators.system_tests = nil

    excluded_routes = ->(env) { !env["PATH_INFO"].match(%r{^/api}) }
    config.middleware.use OliveBranch::Middleware,
                          inflection: "camel",
                          exclude_params: excluded_routes,
                          exclude_response: excluded_routes
  end
end
