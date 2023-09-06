# frozen_string_literal: true

class ApiWrapperController < ApplicationController
  def index
    return unless parameters_set?

    result = ApiWrapper::Index::Organizer.call(params_to_validate: index_params)
    if result.success?
      @activity = result.activity
    else
      flash.now[:alert] = result.errors
      render :index, status: result.semantic_status || 400
    end
  end

  def latest_activities
    result = ApiWrapper::LatestActivities::Organizer.call(latest_activities_params:)
    @pagy, @activities = pagy(result.activities)

    if result.success?
      @pagy, @activities = pagy(result.activities)
    else
      flash.now[:alert] = result.errors
      render :latest_activities, status: result.semantic_status || 400
    end
  end

  private

  def index_params
    params.permit(:type, :participants, :minprice, :maxprice, :minaccessibility, :maxaccessibility)
  end

  def latest_activities_params
    params.permit(:order, :sort)
  end

  def parameters_set?
    index_params.values.any?(&:present?)
  end
end
