require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should belong_to :listing }
end
