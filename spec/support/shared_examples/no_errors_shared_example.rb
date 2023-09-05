# frozen_string_literal: true

RSpec.shared_examples 'no errors' do
  it 'has no errors' do
    expect(result.errors).to be_blank
  end
end
