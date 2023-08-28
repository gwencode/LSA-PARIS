class Post < ApplicationRecord
  validates :category, :title, :content, presence: true
end
