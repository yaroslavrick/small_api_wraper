# frozen_string_literal: true

module ApiWrapper
  module LatestActivities
    class Organizer < BaseOrganizer
      organize ApiWrapper::LatestActivities::Initialization,
               ApiWrapper::LatestActivities::FetchCollection
    end
  end
end
