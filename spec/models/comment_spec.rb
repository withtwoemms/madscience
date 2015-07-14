require 'rails_helper'
describe Comment do
  let!(:project_comment) { build(:project_comment) }
  let!(:experiment_comment) { build(:experiment_comment) }
  let!(:observed_experiment_comment) { build(:observed_experiment_comment) }
  let!(:observed_procedure_comment) { build(:observed_procedure_comment) }

  describe 'Project Comment' do
    it "Should belong to the Comment class" do
      expect(project_comment.class.name).to eq("Comment")
    end

    it "should belong to a project" do
      expect(project_comment.commentable.class.name).to eq("Project")
    end
  end
end
