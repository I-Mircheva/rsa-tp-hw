require 'rails_helper'

RSpec.describe "rsas/index", type: :view do
  before(:each) do
    assign(:rsas, [
      Rsa.create!(),
      Rsa.create!()
    ])
  end

  it "renders a list of rsas" do
    render
  end
end
