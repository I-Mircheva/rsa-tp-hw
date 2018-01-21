require 'rails_helper'
# `rails-controller-testing` gem.

RSpec.describe MessagesController, type: :controller do

  let(:key) { RsaFull.create!( n: 13021, e: 1237, d: 3965) } #Creates global variable key

  describe "POST #create" do
    it "Creates a message" do
      post :create, as: :json, params: { id: key.id, message: "I am da one"}

      message_id = JSON.parse(response.body)["id"]
      expect(Message.where(id: message_id)).to exist
    end
  end

  describe "POST #decrypt" do
    it "Decrypts a message" do
      post :decrypt, as: :json, params: { id: key.id, message:"8000.2524.2219.4362.4606.6971.3086.1283.96.3808"}

      expect(JSON.parse(response.body)["message"].to_s).to eq "Quick Fox!"
    end
  end

  describe "GET #show" do
    it "Returns a message" do
      message = Message.create!( content: "Encrypted Quick Fox!")
      get :show, as: :json, params: { id: key.id, message_id: message.id}

      message_encrypted = JSON.parse(response.body)["message"]
      expect(message_encrypted.to_s).to eq "Encrypted Quick Fox!"
    end
  end
end
