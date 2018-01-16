require 'rails_helper'

RSpec.describe "rsas/edit", type: :view do
  before(:each) do
    @rsa = assign(:rsa, Rsa.create!())
  end

  it "renders the edit rsa form" do
    render

    assert_select "form[action=?][method=?]", rsa_path(@rsa), "post" do
    end
  end
end
