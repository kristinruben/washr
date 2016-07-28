class Laundromat < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  has_many :washers, :dependent => :delete_all
  has_many :dryers, :dependent => :delete_all
end
