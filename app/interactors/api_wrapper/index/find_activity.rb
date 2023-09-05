# frozen_string_literal: true

module ApiWrapper
  module Index
    class FindActivity < BaseInteractor
      API_LINK = 'https://www.boredapi.com/api/activity'

      delegate :valid_params, to: :context

      def call
        context.activity = fetch_activity
        context.semantic_status = 200
      rescue Faraday::Error => e
        handle_error("Network Error: #{e.message}")
      rescue JSON::ParserError => e
        handle_error("JSON Parsing Error: #{e.message}")
      end

      private

      def fetch_activity
        response = Faraday.get(API_LINK, valid_params)
        JSON.parse(response.body)
      end

      def handle_error(errors)
        context.fail!(errors:, semantic_status: 422)
      end
    end
  end
end
