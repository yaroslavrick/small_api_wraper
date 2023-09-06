# frozen_string_literal: true

RSpec.describe Activity do
  describe 'database columns' do
    it { is_expected.to have_db_column(:activity).of_type(:string) }
    it { is_expected.to have_db_column(:activity_type).of_type(:string) }
    it { is_expected.to have_db_column(:participants).of_type(:integer) }
    it { is_expected.to have_db_column(:price).of_type(:float) }
    it { is_expected.to have_db_column(:link).of_type(:string) }
    it { is_expected.to have_db_column(:key).of_type(:string) }
    it { is_expected.to have_db_column(:accessibility).of_type(:float) }
  end
end
