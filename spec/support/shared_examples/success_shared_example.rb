# frozen_string_literal: true

RSpec.shared_examples 'success' do
  it 'returns success' do
    expect(result).to be_success
  end
end
