# frozen_string_literal: true

module ApiWrapper
  module Index
    class Initialization < BaseInteractor
      def call
        context.validator_class = ApiWrapper::IndexValidator
        context.model = Activity
      end
    end
  end
end
