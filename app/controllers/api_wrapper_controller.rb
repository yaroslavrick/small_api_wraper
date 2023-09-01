# frozen_string_literal: true

class ApiWrapperController < ApplicationController
  def index
    result = ApiWrapper::Index::Organizer.call(filter_params:)
    @activity = result.activity
    @activity_types = result.activity_types
  end

  def latest_activities
    result = ApiWrapper::LatestActivities::Organizer.call(latest_activities_params:)
    @pagy, @activities = pagy(result.activities)
  end

  private

  def filter_params
    params.permit(:type, :participants, :minprice, :maxprice, :minaccessibility, :maxaccessibility)
  end

  def latest_activities_params
    params.permit(:order, :sort)
  end
end
