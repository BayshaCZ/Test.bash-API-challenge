require 'bundler'
Bundler.require
require './requests/api.rb'
require './payloads/payloads.rb'

RSpec::Matchers.define :match_schema do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/schemas"
    schema_path = "#{schema_directory}/#{schema}.schema.json"
    JSON::Validator.validate!(schema_path, response)
  end
end
