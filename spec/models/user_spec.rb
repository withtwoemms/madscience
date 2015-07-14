require 'rails_helper'

describe User do
	let!(:project) { build(:project) }
	let!(:faculty_user) { build(:faculty_user) }
	let!(:staff_user) { build(:staff_user) }
	let!(:generic_user) { build(:user) }
	let!(:user) { build(:user) }

	it "user should have position title of faculty" do
    expect(faculty_user.position.title).to eq("faculty")
  end

  it "user should have position title of staff" do
    expect(staff_user.position.title).to eq("staff")
  end

  describe "should have valid emails" do
  	# it "should not be valid" do 
	  # 	user1 = user.dup
	  # 	user1.email = "hello"
	  # 	user2 = user.dup
	  # 	user2.email = "hello@"
	  # 	user3 = user.dup
	  # 	user3.email = "hello@com"
	  # 	user4 = user.dup
	  # 	user4.email = "hello@hello.com"
	  # 	user5 = user.dup
	  # 	user5.email = "hello@hello.co.uk"
  	# 	expect(user1.email).not_to be_valid  	
  	# 	expect(user2.email).not_to be_valid
  	# 	expect(user3.email).not_to be_valid
  	# 	expect(user4.email).to be_valid
  	# 	expect(user5.email).to be_valid
  	# end
  end

  describe "#name" do
  	it "should return a full name" do 
  		expect(generic_user.full_name).to eq("#{user.first_name} #{user.last_name}")
  	end
  end
end
