# frozen_string_literal: true

RSpec.describe ApiWrapper::LatestActivities::Organizer do
  describe '.call' do
    subject(:result) { described_class.call(latest_activities_params:) }

    context 'when valid params' do
      let(:latest_activities_params) do
        {
          order: 'desc',
          sort: 'accessibility'
        }
      end

      it_behaves_like 'organizer', [
        ApiWrapper::LatestActivities::Initialization,
        ApiWrapper::LatestActivities::FetchCollection
      ]

      it_behaves_like 'semantic status', 200
      it_behaves_like 'success'
    end
  end
end
