
require 'rails_helper'
# `rails-controller-testing` gem.

RSpec.describe RsaFullsController, type: :controller do

  describe "GET #show" do
    it "Gets a key by id" do
      key = RsaFull.create!( n: 13021, e: 1237, d: 3965)
      get :show, as: :json, params: {id: key.id}
      response_body = JSON.parse(response.body)

      expect(response_body["n"]).to eq 13021
      expect(response_body["e"]).to eq 1237
      expect(response_body["d"]).to eq 3965
    end
  end

  describe "POST #create" do
    it "Creates( NO params ) and checks if a key exists in the database" do
      post :create, as: :json
      key_id = JSON.parse(response.body)["id"]

      expect(RsaFull.where(id: key_id)).to exist
    end

    it "Creates( WITH params ) and checks if a key exists in the database" do
      post :create, as: :json, params: {n: 19, e: 14, d: 48}
      key_id = JSON.parse(response.body)["id"]
      rsa = RsaFull.find_by(id: key_id)

      expect(rsa).to be_present
      expect(rsa.n.to_i).to eq 19
      expect(rsa.e.to_i).to eq 14
      expect(rsa.d.to_i).to eq 48
    end
  end
end
