require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should validate_presence_of(:body) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(:required)
  end
  it 'should validate that :beer cannot be empty/falsy' do
    should validate_presence_of(:beer).with_message(:required)
  end
  it { should validate_length_of(:body).is_at_least(1) }
  # it { should validate_length_of(:body).is_at_most(100) }
  it { should belong_to(:user) }
  it { should belong_to(:beer) }
end
