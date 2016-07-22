class Laundromat < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :washers_available, presence: true
  validates :dryers_available, presence: true

  has_many :washers
  has_many :dryers
  belongs_to :user
end
