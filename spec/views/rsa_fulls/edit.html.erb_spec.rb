require 'rails_helper'

RSpec.describe "rsa_fulls/edit", type: :view do
  before(:each) do
    @rsa_full = assign(:rsa_full, RsaFull.create!(
      :n => 1,
      :e => 1,
      :d => 1
    ))
  end

  it "renders the edit rsa_full form" do
    render

    assert_select "form[action=?][method=?]", rsa_full_path(@rsa_full), "post" do

      assert_select "input[name=?]", "rsa_full[n]"

      assert_select "input[name=?]", "rsa_full[e]"

      assert_select "input[name=?]", "rsa_full[d]"
    end
  end
end
