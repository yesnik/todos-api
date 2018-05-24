require 'rails_helper'

RSpec.describe Todo, type: :model do
  # Relations
  it { is_expected.to have_many(:items).dependent(:destroy) }

  # Validations
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:created_by) }
end
