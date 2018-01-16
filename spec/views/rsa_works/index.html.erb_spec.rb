require 'rails_helper'

RSpec.describe "rsa_works/index", type: :view do
  before(:each) do
    assign(:rsa_works, [
      RsaWork.create!(),
      RsaWork.create!()
    ])
  end

  it "renders a list of rsa_works" do
    render
  end
end
