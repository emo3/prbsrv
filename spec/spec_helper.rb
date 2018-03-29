# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'redhat'
  config.version = '7.4'
end
