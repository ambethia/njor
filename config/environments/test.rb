Rails.application.configure do
  config.consider_all_requests_local = true
  config.cache_classes = true
  config.action_dispatch.show_exceptions = true
  config.active_support.deprecation = :stderr
end
