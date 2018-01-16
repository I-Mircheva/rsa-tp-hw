require 'rails_helper'

RSpec.describe "rsas/new", type: :view do
  before(:each) do
    assign(:rsa, Rsa.new())
  end

  it "renders new rsa form" do
    render

    assert_select "form[action=?][method=?]", rsas_path, "post" do
    end
  end
end
