class Brewery < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :beers
end
