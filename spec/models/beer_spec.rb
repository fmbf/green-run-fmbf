require 'rails_helper'

RSpec.describe Beer, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:brewery_id) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:brewery).with_message(:required)
  end
  it { should belong_to(:brewery) }
  it { should have_many(:comments) }
end
