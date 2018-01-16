require 'rails_helper'

RSpec.describe "rsa_works/show", type: :view do
  before(:each) do
    @rsa_work = assign(:rsa_work, RsaWork.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
