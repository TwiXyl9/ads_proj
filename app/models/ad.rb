class Ad < ApplicationRecord
  mount_uploaders :photos, PhotosUploader
  belongs_to :user
  has_one :tag
  enum stage: [:draft, :pending, :rejected, :published, :archival]
  validates :photos, presence: true
end
