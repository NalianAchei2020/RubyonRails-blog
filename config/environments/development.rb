# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Development environment specific configuration
  development_configuration
  caching_configuration
  # Other configurations...
end

def development_configuration
  # ...
end

def caching_configuration
  if caching_enabled?
    enable_caching
    configure_caching_store
    configure_public_file_server_headers
  else
    disable_caching
    configure_null_store
  end
end

def caching_enabled?
  Rails.root.join('tmp/caching-dev.txt').exist?
end

def enable_caching
  config.action_controller.perform_caching = true
  config.action_controller.enable_fragment_cache_logging = true
end

def configure_caching_store
  config.cache_store = :memory_store
end

def configure_public_file_server_headers
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.to_i}"
  }
end

def disable_caching
  config.action_controller.perform_caching = false
end

def configure_null_store
  config.cache_store = :null_store
end
