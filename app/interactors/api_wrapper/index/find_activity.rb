# frozen_string_literal: true

module ApiWrapper
  module Index
    class FindActivity < BaseInteractor
      API_LINK = 'https://www.boredapi.com/api/activity'

      delegate :filter_params, to: :context

      def call
        context.activity = fetch_activity
      end

      private

      def fetch_activity
        response = Faraday.get(API_LINK, filter_params)
        JSON.parse(response.body)
      end
    end
  end
end
