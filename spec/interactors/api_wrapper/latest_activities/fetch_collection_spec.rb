# frozen_string_literal: true

RSpec.describe ApiWrapper::LatestActivities::FetchCollection do
  describe '.call' do
    subject(:result) { described_class.call(context) }

    let(:context) do
      {
        query_object_class: ApiWrapper::LatestActivities::SortQuery,
        latest_activities_params:,
        model: Activity
      }
    end

    let(:latest_activities_params) { { order: 'desc', sort: 'accessibility' } }

    before do
      create(:activity, accessibility: 3)
      create(:activity, accessibility: 4)
    end

    context 'when valid params' do
      it 'returns ActiveRecord::Relation' do
        expect(result.activities).to be_a(ActiveRecord::Relation)
      end

      it_behaves_like 'success'
    end
  end
end
