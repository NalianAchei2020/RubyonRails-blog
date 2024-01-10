# frozen_string_literal: true

# The `Project::Application` class represents the main application configuration for the Ruby on Rails project.
# It sets various configuration options and initializes default settings.
module Project
  # It sets various configuration options and initializes default settings.
  class Application < Rails::Application
    # Initialize configuration defaults for the originally generated Rails version.
    config.load_defaults 7.1

    # Please add any other `lib` subdirectories that do not contain `.rb` files or should not be reloaded or eager loaded
    # to the `ignore` list. Common examples include `templates`, `generators`, or `middleware`.
    config.autoload_lib(
      ignore: %w[
        assets
        tasks
      ]
    )

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files in config/environments,
    # which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
