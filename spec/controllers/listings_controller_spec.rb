require 'rails_helper'

RSpec.describe ListingsController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_attributes) {
    { name: 'Name',
      description: 'Item description',
      price: '5.00',
      image: Rack::Test::UploadedFile.new("#{Rails.root}/spec/factories/rails.png", 'image/png')}
  }

  let(:invalid_attributes) {
    { name: nil,
      description: nil,
      price: nil,
      image: nil }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all listings as @listings" do
      listing = Listing.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:listings)).to eq([listing])
    end
  end

  describe "GET #show" do
    it "assigns the requested listing as @listing" do
      listing = Listing.create! valid_attributes
      get :show, {:id => listing.to_param}, valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "GET #new" do
    it "assigns a new listing as @listing" do
      sign_in :user, user
      get :new, {}, valid_session
      expect(assigns(:listing)).to be_a_new(Listing)
    end
  end

  describe "GET #edit" do
    it "assigns the requested listing as @listing" do
      sign_in :user, user
      listing = Listing.create! valid_attributes
      get :edit, {:id => listing.to_param}, valid_session
      expect(assigns(:listing)).to eq(listing)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        sign_in :user, user
      end

      it "creates a new Listing" do
        expect {
          post :create, {:listing => valid_attributes}, valid_session
        }.to change(Listing, :count).by(1)
      end

      it "assigns a newly created listing as @listing" do
        post :create, {:listing => valid_attributes}, valid_session
        expect(assigns(:listing)).to be_a(Listing)
        expect(assigns(:listing)).to be_persisted
      end

      it "redirects to the created listing" do
        post :create, {:listing => valid_attributes}, valid_session
        expect(response).to redirect_to(Listing.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved listing as @listing" do
        post :create, {:listing => invalid_attributes}, valid_session
        expect(assigns(:listing)).to be_a_new(Listing)
      end

      it "re-renders the 'new' template" do
        post :create, {:listing => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested listing" do
        listing = Listing.create! valid_attributes
        put :update, {:id => listing.to_param, :listing => new_attributes}, valid_session
        listing.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested listing as @listing" do
        listing = Listing.create! valid_attributes
        put :update, {:id => listing.to_param, :listing => valid_attributes}, valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "redirects to the listing" do
        listing = Listing.create! valid_attributes
        put :update, {:id => listing.to_param, :listing => valid_attributes}, valid_session
        expect(response).to redirect_to(listing)
      end
    end

    context "with invalid params" do
      it "assigns the listing as @listing" do
        listing = Listing.create! valid_attributes
        put :update, {:id => listing.to_param, :listing => invalid_attributes}, valid_session
        expect(assigns(:listing)).to eq(listing)
      end

      it "re-renders the 'edit' template" do
        listing = Listing.create! valid_attributes
        put :update, {:id => listing.to_param, :listing => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested listing" do
      listing = Listing.create! valid_attributes
      expect {
        delete :destroy, {:id => listing.to_param}, valid_session
      }.to change(Listing, :count).by(-1)
    end

    it "redirects to the listings list" do
      listing = Listing.create! valid_attributes
      delete :destroy, {:id => listing.to_param}, valid_session
      expect(response).to redirect_to(listings_url)
    end
  end

end
