require 'rails_helper'

RSpec.describe "rsas/show", type: :view do
  before(:each) do
    @rsa = assign(:rsa, Rsa.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
