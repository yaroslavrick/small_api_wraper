# frozen_string_literal: true

RSpec.describe ApiWrapper::IndexValidator do
  describe '.call' do
    subject(:result) { described_class.new.call(input) }

    describe 'validations' do
      context 'when input is valid' do
        context 'when all params are valid' do
          let(:input) do
            {
              type: 'education',
              participants: 1,
              minprice: 0,
              maxprice: 0.1,
              minaccessibility: 0,
              maxaccessibility: 0.1
            }
          end

          it_behaves_like 'success'
        end

        context 'when type is valid' do
          let(:input) { { type: 'education' } }

          it_behaves_like 'success'
        end

        context 'when participants is valid' do
          let(:input) { { participants: 1 } }

          it_behaves_like 'success'
        end

        context 'when minprice is valid' do
          let(:input) { { minprice: 0 } }

          it_behaves_like 'success'
        end

        context 'when maxprice is valid' do
          let(:input) { { maxprice: 0.1 } }

          it_behaves_like 'success'
        end

        context 'when minaccessibility is valid' do
          let(:input) { { minaccessibility: 0 } }

          it_behaves_like 'success'
        end

        context 'when maxaccessibility is valid' do
          let(:input) { { maxaccessibility: 0.1 } }

          it_behaves_like 'success'
        end

        context 'when all params blank' do
          let(:input) do
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
        end
      end

      context 'when input is invalid' do
        context 'when activity is invalid' do
          let(:input) { { activity: 1 } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { activity: ['must be a string'] }
        end

        context 'when type is invalid' do
          let(:input) { { type: 1 } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { type: ['must be a string'] }
        end

        context 'when participants is invalid' do
          let(:input) { { participants: 'invalid' } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { participants: ['must be an integer'] }
        end

        context 'when minprice is invalid' do
          let(:input) { { minprice: 'invalid' } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { minprice: ['must be a float'] }
        end

        context 'when maxprice is invalid' do
          let(:input) { { maxprice: 'invalid' } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { maxprice: ['must be a float'] }
        end

        context 'when minaccessibility is invalid' do
          let(:input) { { minaccessibility: 'invalid' } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { minaccessibility: ['must be a float'] }
        end

        context 'when maxaccessibility is invalid' do
          let(:input) { { maxaccessibility: 'invalid' } }

          it_behaves_like 'failure'
          it_behaves_like 'validation error message', { maxaccessibility: ['must be a float'] }
        end
      end
    end
  end
end
