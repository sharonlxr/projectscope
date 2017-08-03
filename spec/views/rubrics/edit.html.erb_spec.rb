require 'rails_helper'

RSpec.describe "rubrics/edit", type: :view do
  before(:each) do
    @rubric = assign(:rubric, Rubric.create!(
      :iteration => 1,
      :metric_name => "MyString",
      :params => "MyText"
    ))
  end

  it "renders the edit rubric form" do
    render

    assert_select "form[action=?][method=?]", rubric_path(@rubric), "post" do

      assert_select "input#rubric_iteration[name=?]", "rubric[iteration]"

      assert_select "input#rubric_metric_name[name=?]", "rubric[metric_name]"

      assert_select "textarea#rubric_params[name=?]", "rubric[params]"
    end
  end
end
