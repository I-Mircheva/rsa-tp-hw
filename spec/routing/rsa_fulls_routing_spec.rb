require "rails_helper"

RSpec.describe RsaFullsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rsa_fulls").to route_to("rsa_fulls#index")
    end

    it "routes to #new" do
      expect(:get => "/rsa_fulls/new").to route_to("rsa_fulls#new")
    end

    it "routes to #show" do
      expect(:get => "/rsa_fulls/1").to route_to("rsa_fulls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rsa_fulls/1/edit").to route_to("rsa_fulls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rsa_fulls").to route_to("rsa_fulls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rsa_fulls/1").to route_to("rsa_fulls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rsa_fulls/1").to route_to("rsa_fulls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rsa_fulls/1").to route_to("rsa_fulls#destroy", :id => "1")
    end

  end
end
