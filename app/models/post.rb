class Post < ApplicationRecord
  validates :category, :title, :content, :date, presence: true
end
