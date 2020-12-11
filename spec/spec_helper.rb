require 'bundler/setup'
require 'shopee/api'
require 'dotenv/load'
require 'simplecov'
require 'vcr'

SimpleCov.start do
  add_filter '/spec/'
  add_group 'Lib', 'lib'
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { :match_requests_on => [:host, :path] }

  config.filter_sensitive_data('<PARTNER_ID>') { ENV['PARTNER_ID'] }
  config.filter_sensitive_data('<PARTNER_KEY>') { ENV['PARTNER_ID'] }
  config.filter_sensitive_data('<REDIRECT_URI>') { ENV['REDIRECT_URI'] }
  config.filter_sensitive_data('<SHOPID>') { ENV['SHOPID'] }
  config.filter_sensitive_data('<AUTH_CODE>') { ENV['AUTH_CODE'] }
  config.filter_sensitive_data('<AUTH_ACCESS_TOKEN>') { ENV['AUTH_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<AUTH_REFRESH_TOKEN>') { ENV['AUTH_REFRESH_TOKEN'] }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
