require 'rails_helper'

RSpec.describe "rubrics/show", type: :view do
  before(:each) do
    @rubric = assign(:rubric, Rubric.create!(
      :iteration => 2,
      :metric_name => "Metric Name",
      :params => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Metric Name/)
    expect(rendered).to match(/MyText/)
  end
end
