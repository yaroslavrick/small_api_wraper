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
    params = options.transform_keys(&:to_s)
    result = ApiWrapper::Index::Organizer.call(params_to_validate: params)
    if result.success?
      console_print(result)
    else
      puts "Error: #{result.errors}"
    end
  end

  private

  def console_print(result)
    pastel = Pastel.new
    headers = colorized_headers(pastel)
    rows = colorized_rows(pastel, result.activity)

    table = TTY::Table.new headers, rows
    puts table.render(:ascii, padding: [0, 1, 0, 1])
    puts pastel.yellow("\nActivity saved to database")
  end

  def colorized_headers(pastel)
    %w[Activity Type Participants Price Link Key Accessibility].map { |header| pastel.blue.bold(header) }
  end

  def colorized_rows(pastel, activity)
    row_data = activity.keys
    row = row_data.map { |key| pastel.green(activity[key]) }
    [row]
  end
end

MyProgram.start(ARGV)
