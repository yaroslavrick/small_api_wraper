# frozen_string_literal: true

RSpec.describe ApiWrapper::LatestActivities::SortQuery do
  describe '#call' do
    subject(:result) { described_class.new(params, scope).call }

    let(:scope) { Activity }

    context 'when valid params' do
      context 'when sort by activity_type' do
        let(:params) { { sort: 'activity_type', order: 'desc' } }
        let(:activity_a) { create(:activity, activity_type: 'A') }
        let(:activity_b) { create(:activity, activity_type: 'B') }

        it 'returns sorted scope' do
          expect(result).to eq [activity_b, activity_a]
        end
      end

      context 'when sort by participants' do
        let(:params) { { sort: 'participants', order: 'desc' } }
        let(:activity_a) { create(:activity, participants: 1) }
        let(:activity_b) { create(:activity, participants: 2) }

        it 'returns sorted scope' do
          expect(result).to eq [activity_b, activity_a]
        end
      end

      context 'when sort by price' do
        let(:params) { { sort: 'price', order: 'desc' } }
        let(:activity_a) { create(:activity, price: 1) }
        let(:activity_b) { create(:activity, price: 2) }

        it 'returns sorted scope' do
          expect(result).to eq [activity_b, activity_a]
        end
      end

      context 'when sort by accessibility' do
        let(:params) { { sort: 'accessibility', order: 'desc' } }
        let(:activity_a) { create(:activity, accessibility: 1) }
        let(:activity_b) { create(:activity, accessibility: 2) }

        it 'returns sorted scope' do
          expect(result).to eq [activity_b, activity_a]
        end
      end

      context 'when sort by created_at' do
        let(:params) { { sort: 'created_at', order: 'desc' } }
        let(:activity_a) { create(:activity, created_at: 1.day.ago) }
        let(:activity_b) { create(:activity, created_at: 2.days.ago) }

        it 'returns sorted scope' do
          expect(result).to eq [activity_a, activity_b]
        end
      end
    end
  end
end
