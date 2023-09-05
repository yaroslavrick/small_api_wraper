# frozen_string_literal: true

RSpec.shared_examples 'http status' do |status|
  it "renders #{status}" do
    expect(response).to have_http_status(status)
  end
end
