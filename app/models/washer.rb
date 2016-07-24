class Washer < ActiveRecord::Base
  validates :number_available, presence: true

  belongs_to :laundromat
end
