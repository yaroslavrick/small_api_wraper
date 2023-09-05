# frozen_string_literal: true

RSpec.describe ApiWrapper::Index::SaveActivity do
  describe '.call' do
    subject(:result) { described_class.call(activity:, model:) }

    context 'when success' do
      let(:activity) do
        {
          'activity' => 'activity',
          'type' => 'type',
          'participants' => 2,
          'price' => 0,
          'link' => 'link',
          'key' => 'key',
          'accessibility' => 0
        }
      end

      let(:model) { Activity }

      it_behaves_like 'success'
      it_behaves_like 'semantic status', 201
      it_behaves_like 'no errors'

      it 'creates activity' do
        expect { result }.to change(Activity, :count).by(1)
      end
    end

    context 'when failure' do
      context 'when ActiveRecord::StatementInvalid' do
        let(:activity) do
          {
            'activity' => 'activity',
            'type' => 'type',
            'participants' => 2,
            'price' => 0,
            'link' => 'link',
            'key' => 'key',
            'accessibility' => 0
          }
        end

        let(:model) { Activity }

        before do
          allow(model).to receive(:create!).and_raise(ActiveRecord::StatementInvalid)
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'ActiveRecord::StatementInvalid'
      end

      context 'when ActiveRecord::RecordInvalid' do
        let(:activity) do
          {
            'activity' => 'activity',
            'type' => 'type',
            'participants' => 2,
            'price' => 0,
            'link' => 'link',
            'key' => 'key',
            'accessibility' => 0
          }
        end

        let(:model) { Activity }

        before do
          allow(model).to receive(:create!).and_raise(ActiveRecord::RecordInvalid)
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'Record invalid'
      end
    end
  end
end
