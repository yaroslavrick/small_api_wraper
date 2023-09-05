# frozen_string_literal: true

RSpec.describe ApiWrapper::Index::FindActivity do
  describe '.call' do
    subject(:result) do
      described_class.call(params_to_validate:)
    end

    context 'when valid params' do
      context 'when all params blank' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when all params present' do
        let(:params_to_validate) do
          {
            type: 'education',
            participants: 2,
            minprice: 0,
            maxprice: 0.1,
            minaccessibility: 0,
            maxaccessibility: 0.1
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when type present' do
        let(:params_to_validate) do
          {
            type: 'education',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when participants present' do
        let(:params_to_validate) do
          {
            type: '',
            participants: 2,
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when minprice present' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: 0,
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when maxprice present' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: 0.1,
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when minaccessibility present' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: 0,
            maxaccessibility: ''
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end

      context 'when maxaccessibility present' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: 0.1
          }
        end

        it_behaves_like 'success'
        it_behaves_like 'semantic status', 200
        it_behaves_like 'no errors'

        it 'returns activity' do
          expect(result.activity).to be_a(Hash)
        end
      end
    end

    context 'when errors' do
      context 'when Faraday::Error' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        before do
          allow(Faraday).to receive(:get).and_raise(Faraday::Error, 'error')
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'Network Error: error'
      end

      context 'when JSON::ParserError' do
        let(:params_to_validate) do
          {
            type: '',
            participants: '',
            minprice: '',
            maxprice: '',
            minaccessibility: '',
            maxaccessibility: ''
          }
        end

        before do
          allow(JSON).to receive(:parse).and_raise(JSON::ParserError, 'error')
        end

        it_behaves_like 'failure'
        it_behaves_like 'semantic status', 422
        it_behaves_like 'error message', 'JSON Parsing Error: error'
      end
    end
  end
end
