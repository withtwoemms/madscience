require 'rails_helper'
describe Project do
  let!(:project) { build(:project) }
  let!(:user) { build(:user) }
  let!(:faculty_project) { build(:faculty_project) }
  let!(:staff_project) { build(:staff_project) }

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

  it "faculty projects have the correct creator position" do
    expect(faculty_project.creator.position.title).to eq("faculty")
  end

  it "staff projects have the correct creator" do
    expect(staff_project.creator.position.title).to eq("staff")
  end
end
