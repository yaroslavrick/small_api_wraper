# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class FetchCollection < BaseInteractor
      def call
        context.activities = context.query_object_class.new(context.latest_activities_params, context.model).call
        context.semantic_status = 200
      end
    end
  end
end
