require 'rails_helper'
# `rails-controller-testing` gem.

RSpec.describe RsaFullsController, type: :controller do

  describe "Working with keys" do
      it "Gets a key by id" do
        get :show, as: :json, params: {id: 1}
        expect(response.body).to eq("{\"n\":13021,\"e\":1237,\"d\":3965}")
      end

      it "Creates( NO params ) and checks if a key exists in the database" do
        post :create, as: :json
        expect(RsaFull.where(id: JSON.parse(response.body)["id"])).to exist
      end

      it "Creates( WITH params ) and checks if a key exists in the database" do
        post :create, as: :json, params: {n: 19, e: 14, d: 48} ###To Fix
        expect(RsaFull.where(id: JSON.parse(response.body)["id"])).to exist
      end
    end


  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "returns a success response" do
  #     rsa_full = RsaFull.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     rsa_full = RsaFull.create! valid_attributes
  #     get :show, params: {id: rsa_full.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #new" do
  #   it "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns a success response" do
  #     rsa_full = RsaFull.create! valid_attributes
  #     get :edit, params: {id: rsa_full.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new RsaFull" do
  #       expect {
  #         post :create, params: {rsa_full: valid_attributes}, session: valid_session
  #       }.to change(RsaFull, :count).by(1)
  #     end

  #     it "redirects to the created rsa_full" do
  #       post :create, params: {rsa_full: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(RsaFull.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'new' template)" do
  #       post :create, params: {rsa_full: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested rsa_full" do
  #       rsa_full = RsaFull.create! valid_attributes
  #       put :update, params: {id: rsa_full.to_param, rsa_full: new_attributes}, session: valid_session
  #       rsa_full.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "redirects to the rsa_full" do
  #       rsa_full = RsaFull.create! valid_attributes
  #       put :update, params: {id: rsa_full.to_param, rsa_full: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(rsa_full)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "returns a success response (i.e. to display the 'edit' template)" do
  #       rsa_full = RsaFull.create! valid_attributes
  #       put :update, params: {id: rsa_full.to_param, rsa_full: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested rsa_full" do
  #     rsa_full = RsaFull.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: rsa_full.to_param}, session: valid_session
  #     }.to change(RsaFull, :count).by(-1)
  #   end

  #   it "redirects to the rsa_fulls list" do
  #     rsa_full = RsaFull.create! valid_attributes
  #     delete :destroy, params: {id: rsa_full.to_param}, session: valid_session
  #     expect(response).to redirect_to(rsa_fulls_url)
  #   end
  # end

end
