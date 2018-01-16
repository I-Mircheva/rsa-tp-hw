require 'rails_helper'

RSpec.describe "Rsas", type: :request do
  describe "GET /rsas" do
    it "works! (now write some real specs)" do
      get rsas_path
      expect(response).to have_http_status(200)
    end
  end
end
