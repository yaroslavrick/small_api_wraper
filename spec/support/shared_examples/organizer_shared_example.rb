# frozen_string_literal: true

RSpec.shared_examples 'organizer' do |expected_interactors|
  let(:interactor_class) { described_class }

  context 'when organizer' do
    it 'has organizer type' do
      expect(described_class.new).to be_a(Interactor::Organizer)
    end

    it 'contains valid interactors' do
      expect(described_class.organized).to eq(expected_interactors)
    end
  end
end
