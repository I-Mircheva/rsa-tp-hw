require 'rails_helper'

RSpec.describe "rsa_works/new", type: :view do
  before(:each) do
    assign(:rsa_work, RsaWork.new())
  end

  it "renders new rsa_work form" do
    render

    assert_select "form[action=?][method=?]", rsa_works_path, "post" do
    end
  end
end
