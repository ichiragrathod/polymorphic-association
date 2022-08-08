class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :religion, :street_address, :city, :country, :postal_code, :phone_number, :mobile_number, :gender, presence: true       
  validates :mobile_number, :phone_number, numericality: { only_integer: true }, length:{is:10}
  validates :postal_code, numericality: { only_integer: true }, length:{is:6}
end
