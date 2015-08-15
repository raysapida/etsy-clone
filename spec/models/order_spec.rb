require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should belong_to :listing }
  it { should belong_to(:buyer).class_name('User') }
  it { should belong_to(:seller).class_name('User') }
end
