# frozen_string_literal: true

RSpec.shared_examples 'interactor initialization' do |options|
  describe '.call' do
    subject(:result) { described_class.call }

    context 'when interactor initialization' do
      options.each do |key, expected_value|
        it "returns proper #{key}" do
          expect(result.public_send(key)).to eq(expected_value)
        end
      end

      it_behaves_like 'success'
    end
  end
end
