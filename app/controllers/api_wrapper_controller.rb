# frozen_string_literal: true

class ApiWrapperController < ApplicationController
  def index
    result = ApiWrapper::Index::Organizer.call(params_to_validate: index_params)

    if result.success? && index_params.present?
      @activity = result.activity
    else
      handle_error(result, :index)
    end
  end

  def latest_activities
    result = ApiWrapper::LatestActivities::Organizer.call(latest_activities_params:)

    if result.success?
      @pagy, @activities = pagy(result.activities)
    else
      handle_error(result, :latest_activities)
    end
  end

  private

  def index_params
    params.permit(:type, :participants, :minprice, :maxprice, :minaccessibility, :maxaccessibility)
  end

  def latest_activities_params
    params.permit(:order, :sort)
  end

  def handle_error(result, action)
    flash.now[:alert] = result.errors
    render action, status: result.semantic_status || 400
  end
end
