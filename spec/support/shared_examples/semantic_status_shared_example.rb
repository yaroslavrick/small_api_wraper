# frozen_string_literal: true

RSpec.shared_examples 'semantic status' do |status|
  it "returns semantic status #{status}" do
    expect(result.semantic_status).to eq(status)
  end
end
