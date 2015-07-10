class Order < ActiveRecord::Base
  validates_presence_of :address, :city, :state

  belongs_to :listing
end
