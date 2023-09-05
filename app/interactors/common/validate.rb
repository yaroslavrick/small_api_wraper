# frozen_string_literal: true

module Common
  class Validate < BaseInteractor
    def call
      if result.success?
        context.valid_params = context.params_to_validate.to_h
      else
        context.fail!(errors: result.errors, semantic_status: 422)
      end
    end

    private

    def result
      validator_options = context.validator_options || {}
      context.validator_class.new(**validator_options).call(context.params_to_validate.to_h)
    end
  end
end
