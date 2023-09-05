#!/usr/bin/env ruby
# frozen_string_literal: true

require 'thor'
require 'tty-table'
require 'pastel'
require_relative 'config/environment'

class MyProgram < Thor
  desc 'new', 'Fetch random activity and save it to database'
  option :type
  option :participants
  option :minprice
  option :maxprice
  option :minaccessibility
  option :maxaccessibility

  def new
    result = ApiWrapper::Index::Organizer.call(params_to_validate: options.transform_keys(&:to_s))
    result.success? ? new_print(result) : puts("Error: #{result.errors}")
  end

  desc 'list', 'List latest activities'

  def list
    result = ApiWrapper::LatestActivities::Organizer.call(latest_activities_params: { 'order' => 'desc',
                                                                                      'sort' => 'created_at' })
    result.success? ? list_print(result.activities.first(5)) : puts("Error: #{result.errors}")
  end

  private

  def new_print(result)
    pastel = Pastel.new
    headers = colorized_headers(pastel)
    rows = colorized_rows(pastel, result.activity)

    table = TTY::Table.new headers, rows
    puts table.render(:ascii, padding: [0, 1, 0, 1])
    puts pastel.yellow("\nActivity saved to database")
  end

  def list_print(activities)
    pastel = Pastel.new
    headers = colorized_headers(pastel)
    rows = activities.map { |activity| colorized_rows_from_model(pastel, activity) }

    table = TTY::Table.new headers, rows
    puts table.render(:ascii, padding: [0, 1, 0, 1])
  end

  def colorized_headers(pastel)
    %w[Activity Type Participants Price Link Key Accessibility].map { |header| pastel.blue.bold(header) }
  end

  def colorized_rows(pastel, activity)
    row_data = activity.keys
    row = row_data.map { |key| pastel.green(activity[key]) }
    [row]
  end

  def colorized_rows_from_model(pastel, activity)
    [
      pastel.green(activity.activity),
      pastel.green(activity.activity_type),
      pastel.green(activity.participants),
      pastel.green(activity.price),
      pastel.green(activity.link),
      pastel.green(activity.key),
      pastel.green(activity.accessibility)
    ]
  end
end

MyProgram.start(ARGV)
