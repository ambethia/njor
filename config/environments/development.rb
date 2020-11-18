Rails.application.configure do
  config.consider_all_requests_local = true
  config.eager_load = false
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_support.deprecation = :log
  config.active_storage.service = :local
  config.public_file_server.enabled = false
end
