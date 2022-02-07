class Tag < ApplicationRecord
  has_and_belongs_to_many :ads
  validates :name, presence: true
end
