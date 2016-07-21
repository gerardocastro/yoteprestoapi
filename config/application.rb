require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Yoteprestoapi
  class Application < Rails::Application
    config.time_zone = 'Mexico City'

    config.serve_static_files = true

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          :methods => [:get, :post, :options, :delete, :put]
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.factory_girl dir: 'spec/factories'
      g.template_engine false
      g.helper_specs = false
      g.helper = false
      g.stylesheets = false
      g.javascripts = false
    end

    config.active_record.raise_in_transactional_callbacks = false
  end
end
