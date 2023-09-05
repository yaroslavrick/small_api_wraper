# frozen_string_literal: true

RSpec.shared_examples 'failure' do
  it 'returns failure' do
    expect(result).to be_failure
  end

  it 'returns error message' do
    expect(result.errors).to be_present
  end
end
