require 'rails_helper'
describe Project do
  let!(:project) { build(:project) }
  let!(:faculty_user) { build(:faculty_user) }
  let!(:staff_user) { build(:staff_user) }

  it "user should have position title of faculty" do
    expect(faculty_user.position.title).to eq("faculty")
  end

  it "user should have position title of staff" do
    expect(staff_user.position.title).to eq("staff")
  end

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
