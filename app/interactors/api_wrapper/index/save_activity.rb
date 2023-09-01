# frozen_string_literal: true

module ApiWrapper
  module Index
    class SaveActivity < BaseInteractor
      delegate :activity, to: :context

      def call
        Activity.create!(
          activity_type: activity['type'],
          participants: activity['participants'],
          price: activity['price'],
          link: activity['link'],
          key: activity['key'],
          accessibility: activity['accessibility']
        )
      end
    end
  end
end
