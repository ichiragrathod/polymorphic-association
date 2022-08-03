# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :body, presence: true
  has_one_attached :image
  has_one_attached :pdf
  has_many :comments, as: :commentable

  # Validation for image files
  validates :image, :pdf, presence: true
  validates :image, file_size: { less_than_or_equal_to: 1.megabytes, message: "should be less than 1MB." },
  file_content_type: { allow: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
  message: "type must be in JPG, JPEG, PNG format."}

  # Validation for pdf files
  validates :pdf, file_size: { less_than_or_equal_to: 5.megabytes, message: "should be less than 5MB." },
  file_content_type: { allow: ['application/pdf'],
  message: "File format invalid"}
  
end
