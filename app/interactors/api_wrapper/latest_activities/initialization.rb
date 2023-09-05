# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class Initialization < BaseInteractor
      def call
        context.query_object_class = ApiWrapper::LatestActivities::SortQuery
        context.model = Activity
      end
    end
  end
end
