class Event < ApplicationRecord
  validates :title, :description, presence: true
  has_many :comments, as: :commentable
end
