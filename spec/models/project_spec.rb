require 'rails_helper'
describe Project do
  let!(:project) { build(:project) }

  it "project should belong to Project class" do
    expect(project.class.name).to eq("Project")
  end

  it "project should have a name of 'Create tests'" do
    expect(project.name).to eq("Create tests")
  end

  it "should have correct attributes" do
    [:name, :summary, :hypothesis].each do |attribute|
      expect(project).to have_attribute(attribute)
    end
  end


end
