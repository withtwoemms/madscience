require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
  	let!(:faculty_user) { build(:faculty_user) } 
    it "returns http success" do
      get :new, { user: faculty_user }
      expect(response).to be_success
    end
  end

  describe "POST new" do
  	let!(:user) { build(:user) }
    it "returns http success" do
      expect(response).to render_template("/users/new")
      controller.should_receive(:render).with(:partial => 'path/to/partial')
    end
  end

end
