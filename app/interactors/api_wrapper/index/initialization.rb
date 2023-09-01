# frozen_string_literal: true

module ApiWrapper
  module Index
    class Initialization < BaseInteractor
      def call
        context.activity_types = %w[education recreational social diy charity cooking relaxation music busywork]
      end
    end
  end
end
