# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    sequence(:activity_type) { |n| "#{FFaker::Music.album} #{n}" }
    participants { FFaker::Number.number(digits: 1) }
    price { FFaker::Number.number(digits: 1) }
    link { FFaker::Internet.http_url }
    key { FFaker::Number.number(digits: 3).to_s }
    accessibility { FFaker::Number.number(digits: 1) }
  end
end
