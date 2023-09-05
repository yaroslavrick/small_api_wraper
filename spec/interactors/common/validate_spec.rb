# frozen_string_literal: true

RSpec.describe Common::Validate do
  describe '.call' do
    subject(:result) { described_class.call(**input_params) }

    let(:input_params) do
      {
        params_to_validate: { params: :to_validate },
        validator_class:
      }
    end

    context 'when params are invalid' do
      # rubocop:disable RSpec/VerifiedDoubleReference
      let(:validation_result) { instance_double('ValidationResult') }
      let(:validator_class) { class_double('ValidatorClass') }
      let(:validator_instance) { instance_double('ValidatorClass') }
      # rubocop:enable RSpec/VerifiedDoubleReference

      before do
        allow(validation_result).to receive_messages(failure?: true, success?: false, errors: %w[error1 error2])
        allow(validator_class).to receive(:new).and_return validator_instance
        allow(validator_instance).to receive(:call).and_return validation_result
      end

      it_behaves_like 'semantic status', 422
      it_behaves_like 'failure'
    end

    context 'when params are valid' do
      # rubocop:disable RSpec/VerifiedDoubleReference
      let(:validation_result) { instance_double('ValidationResult') }
      let(:validator_class) { class_double('ValidatorClass') }
      let(:validator_instance) { instance_double('ValidatorClass') }
      # rubocop:enable RSpec/VerifiedDoubleReference

      before do
        allow(validation_result).to receive(:success?).and_return true
        allow(validator_class).to receive(:new).and_return validator_instance
        allow(validator_instance).to receive(:call).and_return validation_result
      end

      it_behaves_like 'success'
    end
  end
end
