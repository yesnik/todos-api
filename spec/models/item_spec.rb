require 'rails_helper'

RSpec.describe Item, type: :model do
  # Relations
  it { is_expected.to belong_to(:todo) }

  # Validations
  it { is_expected.to validate_presence_of(:name) }
end
