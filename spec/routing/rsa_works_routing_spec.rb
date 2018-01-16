require "rails_helper"

RSpec.describe RsaWorksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rsa_works").to route_to("rsa_works#index")
    end

    it "routes to #new" do
      expect(:get => "/rsa_works/new").to route_to("rsa_works#new")
    end

    it "routes to #show" do
      expect(:get => "/rsa_works/1").to route_to("rsa_works#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rsa_works/1/edit").to route_to("rsa_works#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rsa_works").to route_to("rsa_works#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rsa_works/1").to route_to("rsa_works#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rsa_works/1").to route_to("rsa_works#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rsa_works/1").to route_to("rsa_works#destroy", :id => "1")
    end

  end
end
