class Ad < ApplicationRecord
  mount_uploaders :photos, PhotosUploader
  belongs_to :user
  has_and_belongs_to_many :tags
  enum stage: [:draft, :pending, :rejected, :published, :archival]
  validates :photos, presence: true
  validates :name, presence: true
end
