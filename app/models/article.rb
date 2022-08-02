class Article < ApplicationRecord
  validates :title, :body, presence: true
  has_one_attached :image
  has_many :comments, as: :commentable
end
