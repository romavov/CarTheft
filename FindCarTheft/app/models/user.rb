class User < ActiveRecord::Base
  has_many :cars
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
