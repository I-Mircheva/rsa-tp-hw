require 'rails_helper'

RSpec.describe "RsaFulls", type: :request do
  describe "GET /rsa_fulls" do
    it "works! (now write some real specs)" do
      get rsa_fulls_path
      expect(response).to have_http_status(200)
    end
  end
end
