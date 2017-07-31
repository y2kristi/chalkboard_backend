require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module ChalkBoard
  class Application < Rails::Application
  config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '/*',
          :headers => :any,
          :methods => [:get, :put, :post, :patch, :options],
          :max_age => 15
      end
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
