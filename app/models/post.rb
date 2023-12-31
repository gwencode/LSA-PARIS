class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :photo
  validates :category, :title, :content, :date, presence: true
end
