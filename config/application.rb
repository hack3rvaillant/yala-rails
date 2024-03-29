require_relative "boot"
# require_relative "../lib/tenant_on_request.rb"

require "rails/all"

require "view_component/engine"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load unless Rails.env.production?
module YalaRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.hosts = nil
    # config.middleware.insert_before Warden::Manager,
    #                                 TenantOnRequest,
    #                                 Proc.new { |request| Community.find_by(slug: request.path[1..-1]) }
  end
end
