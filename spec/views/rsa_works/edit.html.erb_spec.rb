require 'rails_helper'

RSpec.describe "rsa_works/edit", type: :view do
  before(:each) do
    @rsa_work = assign(:rsa_work, RsaWork.create!())
  end

  it "renders the edit rsa_work form" do
    render

    assert_select "form[action=?][method=?]", rsa_work_path(@rsa_work), "post" do
    end
  end
end
