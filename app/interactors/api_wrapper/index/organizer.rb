# frozen_string_literal: true

module ApiWrapper
  module Index
    class Organizer < BaseOrganizer
      organize ApiWrapper::Index::Initialization,
               ApiWrapper::Index::FindActivity,
               ApiWrapper::Index::SaveActivity
    end
  end
end
