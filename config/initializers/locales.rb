Rails.application.config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
Rails.application.config.i18n.available_locales = [:ru, :en] # Restrict available locales to list, that we're supporting
Rails.application.config.i18n.enforce_available_locales = true
Rails.application.config.i18n.default_locale = :ru
Rails.application.config.i18n.fallbacks = false
