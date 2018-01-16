require 'rails_helper'

RSpec.describe "rsa_fulls/index", type: :view do
  before(:each) do
    assign(:rsa_fulls, [
      RsaFull.create!(
        :n => 2,
        :e => 3,
        :d => 4
      ),
      RsaFull.create!(
        :n => 2,
        :e => 3,
        :d => 4
      )
    ])
  end

  it "renders a list of rsa_fulls" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
