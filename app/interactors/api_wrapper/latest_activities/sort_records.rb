# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class SortRecords < BaseInteractor
      delegate :sort, to: :context
      delegate :order, to: :context
      def call
        context.activities = context.model.order(Arel.sql("#{sort} #{order}"))
      end
    end
  end
end
