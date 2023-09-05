# frozen_string_literal: true

module ApiWrapper
  module Index
    class SaveActivity < BaseInteractor
      delegate :activity, :model, to: :context

      def call
        save_record!
        context.semantic_status = 201
      rescue ActiveRecord::StatementInvalid, ActiveRecord::RecordInvalid => e
        handle_error(e.message)
      end

      private

      def save_record!
        model.create!(
          activity: activity['activity'],
          activity_type: activity['type'],
          participants: activity['participants'],
          price: activity['price'],
          link: activity['link'],
          key: activity['key'],
          accessibility: activity['accessibility']
        )
      end

      def handle_error(errors)
        context.fail!(errors:, semantic_status: 422)
      end
    end
  end
end
