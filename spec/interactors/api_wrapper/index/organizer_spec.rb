# frozen_string_literal: true

RSpec.describe ApiWrapper::Index::Organizer do
  describe '.call' do
    subject(:result) { described_class.call(params_to_validate:) }

    context 'when valid params' do
      let(:params_to_validate) do
        {
          type: 'education',
          participants: 1,
          minprice: 0,
          maxprice: 0.1,
          minaccessibility: 0,
          maxaccessibility: 0.1
        }
      end

      it_behaves_like 'organizer', [
        ApiWrapper::Index::Initialization,
        Common::Validate,
        ApiWrapper::Index::FindActivity,
        ApiWrapper::Index::SaveActivity
      ]

      it_behaves_like 'semantic status', 201
      it_behaves_like 'success'
    end
  end
end
