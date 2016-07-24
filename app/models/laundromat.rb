class Laundromat < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  has_many :washers
  has_many :dryers
  belongs_to :user
end
