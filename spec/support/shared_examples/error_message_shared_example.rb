# frozen_string_literal: true

RSpec.shared_examples 'error message' do |message|
  it "returns #{message} error message" do
    expect(result.errors).to include(message)
  end
end
