class Comment < ApplicationRecord
  validates :body, :beer, presence: true

  belongs_to :user
  belongs_to :beer
end
