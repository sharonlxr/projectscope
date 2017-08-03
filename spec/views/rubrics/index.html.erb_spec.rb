require 'rails_helper'

RSpec.describe "rubrics/index", type: :view do
  before(:each) do
    assign(:rubrics, [
      Rubric.create!(
        :iteration => 2,
        :metric_name => "Metric Name",
        :params => "MyText"
      ),
      Rubric.create!(
        :iteration => 2,
        :metric_name => "Metric Name",
        :params => "MyText"
      )
    ])
  end

  it "renders a list of rubrics" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Metric Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
