# spec/spec_helper.rb
require "rack/test"
require "rspec"
require "pry"
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

require File.expand_path "../../my_app.rb", __FILE__

ENV["RACK_ENV"] = "test"

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.extend VCR::RSpec::Macros
end