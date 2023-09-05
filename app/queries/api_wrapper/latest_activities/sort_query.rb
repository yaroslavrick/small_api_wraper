# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class SortQuery
      DEFAULT_SORT = 'created_at'
      DEFAULT_DIRECTION = 'desc'

      attr_reader :sort, :order, :scope

      def initialize(params, scope)
        @sort = params[:sort] || DEFAULT_SORT
        @order = params[:order] || DEFAULT_DIRECTION
        @scope = scope
      end

      def call
        scope.order(Arel.sql("#{sort} #{order}"))
      end
    end
  end
end
