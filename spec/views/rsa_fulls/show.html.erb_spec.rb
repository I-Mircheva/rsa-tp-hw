require 'rails_helper'

RSpec.describe "rsa_fulls/show", type: :view do
  before(:each) do
    @rsa_full = assign(:rsa_full, RsaFull.create!(
      :n => 2,
      :e => 3,
      :d => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
