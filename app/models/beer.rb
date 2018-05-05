class Beer < ApplicationRecord
  validates :brewery, presence: true
  validates :name, presence: true, uniqueness: true

  belongs_to :brewery
  has_many :comments
end
