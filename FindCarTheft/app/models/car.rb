class Car < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  geocoded_by :address
  after_validation :geocode
end
