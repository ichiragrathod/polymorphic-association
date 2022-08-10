# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :religion, :street_address, :city, :country, :postal_code, :phone_number,
            :mobile_number, :gender, presence: true
  validates :mobile_number, :phone_number, numericality: { only_integer: true }, length: { is: 10 }
  validates :postal_code, numericality: { only_integer: true }, length: { is: 6 }
  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
