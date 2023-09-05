# frozen_string_literal: true

class ApplicationValidator < Dry::Validation::Contract
  config.messages.top_namespace = 'small-wrapper'
  config.messages.load_paths << 'config/locales/dry_errors.yml'
end
