require 'rails_helper'

RSpec.describe "rubrics/new", type: :view do
  before(:each) do
    assign(:rubric, Rubric.new(
      :iteration => 1,
      :metric_name => "MyString",
      :params => "MyText"
    ))
  end

  it "renders new rubric form" do
    render

    assert_select "form[action=?][method=?]", rubrics_path, "post" do

      assert_select "input#rubric_iteration[name=?]", "rubric[iteration]"

      assert_select "input#rubric_metric_name[name=?]", "rubric[metric_name]"

      assert_select "textarea#rubric_params[name=?]", "rubric[params]"
    end
  end
end
