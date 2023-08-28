class Post < ApplicationRecord
  has_one_attached :photo
  validates :category, :title, :content, :date, presence: true
end
