class Post < ApplicationRecord
  belongs_to :organization
  has_one_attached :featured_image
end
