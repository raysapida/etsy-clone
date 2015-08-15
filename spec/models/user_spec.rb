require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :name }
  it { should have_many(:listings).dependent(:destroy) }
  it { should have_many(:sales).class_name('Order').with_foreign_key(:seller_id) }
  it { should have_many(:purchases).class_name('Order').with_foreign_key(:buyer_id) }
end
