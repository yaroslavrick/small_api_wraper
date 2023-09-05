# frozen_string_literal: true

RSpec.shared_examples 'validation error message' do |message|
  it "returns #{message} error message" do
    error_messages = result.errors.to_h
    key, value = message.first

    expect(error_messages[key]).to match_array(value)
  end
end
