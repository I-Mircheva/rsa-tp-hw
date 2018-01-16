require 'rails_helper'

RSpec.describe "RsaWorks", type: :request do
  describe "GET /rsa_works" do
    it "works! (now write some real specs)" do
      get rsa_works_path
      expect(response).to have_http_status(200)
    end
  end
end
