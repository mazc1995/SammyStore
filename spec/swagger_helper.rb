require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.to_s + '/swagger'

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'SammyStore',
        version: 'v1'
      },
      paths: {}
    }
  }

  config.swagger_format = :yaml
end
