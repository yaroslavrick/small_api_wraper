# frozen_string_literal: true

RSpec.describe ApiWrapper::LatestActivities::Initialization do
  describe '.call' do
    subject(:result) { described_class.call }

    it_behaves_like 'interactor initialization', {
      query_object_class: ApiWrapper::LatestActivities::SortQuery,
      model: Activity
    }
  end
end
