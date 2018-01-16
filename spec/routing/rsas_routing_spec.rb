require "rails_helper"

RSpec.describe RsasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rsas").to route_to("rsas#index")
    end

    it "routes to #new" do
      expect(:get => "/rsas/new").to route_to("rsas#new")
    end

    it "routes to #show" do
      expect(:get => "/rsas/1").to route_to("rsas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rsas/1/edit").to route_to("rsas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rsas").to route_to("rsas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rsas/1").to route_to("rsas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rsas/1").to route_to("rsas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rsas/1").to route_to("rsas#destroy", :id => "1")
    end

  end
end
