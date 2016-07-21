class Laundromat < ActiveRecord::Base
<<<<<<< HEAD
  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true

  has_many :washers
  has_many :dryers
  belongs_to :user
=======

>>>>>>> master
end
