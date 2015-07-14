require 'rails_helper'

describe User do
	let!(:project) { build(:project) }
	let!(:faculty_user) { build(:faculty_user) }
	let!(:staff_user) { build(:staff_user) }
	let!(:user) { build(:user) }

	it "user should have position title of faculty" do
    expect(faculty_user.position.title).to eq("faculty")
  end

  it "user should have position title of staff" do
    expect(staff_user.position.title).to eq("staff")
  end


  describe "#name" do
  	it "should return a full name" do 
  		expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
  	end
  end
end
