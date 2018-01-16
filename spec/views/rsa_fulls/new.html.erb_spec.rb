require 'rails_helper'

RSpec.describe "rsa_fulls/new", type: :view do
  before(:each) do
    assign(:rsa_full, RsaFull.new(
      :n => 1,
      :e => 1,
      :d => 1
    ))
  end

  it "renders new rsa_full form" do
    render

    assert_select "form[action=?][method=?]", rsa_fulls_path, "post" do

      assert_select "input[name=?]", "rsa_full[n]"

      assert_select "input[name=?]", "rsa_full[e]"

      assert_select "input[name=?]", "rsa_full[d]"
    end
  end
end
