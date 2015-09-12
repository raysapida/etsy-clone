require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/listings/1/orders/new").to route_to(controller: "orders", action: "new", listing_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/listings/1/orders").to route_to(controller: "orders", action: "create", listing_id: "1")
    end

  end
end
