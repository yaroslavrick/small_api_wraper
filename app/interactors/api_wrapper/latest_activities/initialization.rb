# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class Initialization < BaseInteractor
      DEFAULT_SORT = 'created_at'
      DEFAULT_DIRECTION = 'desc'
      def call
        context.sort = context.latest_activities_params[:sort] || DEFAULT_SORT
        context.order = context.latest_activities_params[:order] || DEFAULT_DIRECTION
        context.model = Activity
      end
    end
  end
end
