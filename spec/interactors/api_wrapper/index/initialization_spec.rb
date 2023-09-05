# frozen_string_literal: true

RSpec.describe ApiWrapper::Index::Initialization do
  describe '.call' do
    subject(:result) { described_class.call }

    it_behaves_like 'interactor initialization', {
      validator_class: ApiWrapper::IndexValidator,
      model: Activity
    }
  end
end
