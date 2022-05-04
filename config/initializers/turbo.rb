Rails.application.config.after_initialize do
  Mime::Type.unregister(:turbo_stream)
end