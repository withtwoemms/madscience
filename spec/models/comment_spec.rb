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

    it "should have content" do
      expect(project_comment).to have_attribute(:content)
    end

    it "should have commenter" do
      expect(project_comment.commenter.class.name).to eq("User")
    end
  end

  describe 'Experiment Comment' do
    it "Should belong to the Comment class" do
      expect(experiment_comment.class.name).to eq("Comment")
    end

    it "should belong to an experiment" do
      expect(experiment_comment.commentable.class.name).to eq("Experiment")
    end

    it "should have content" do
      expect(experiment_comment).to have_attribute(:content)
    end

    it "should have commenter" do
      expect(experiment_comment.commenter.class.name).to eq("User")
    end
  end

  describe 'Observed Experiment Comment' do
    it "Should belong to the Comment class" do
      expect(observed_experiment_comment.class.name).to eq("Comment")
    end

    it "should belong to an observation" do
      expect(observed_experiment_comment.commentable.class.name).to eq("Observation")
    end

    it "should have content" do
      expect(observed_experiment_comment).to have_attribute(:content)
    end

    it "should have commenter" do
      expect(observed_experiment_comment.commenter.class.name).to eq("User")
    end
  end

  describe 'Observed Procedure Comment' do
    it "Should belong to the Comment class" do
      expect(observed_procedure_comment.class.name).to eq("Comment")
    end

    it "should belong to an observation" do
      expect(observed_procedure_comment.commentable.class.name).to eq("Observation")
    end

    it "should have content" do
      expect(observed_procedure_comment).to have_attribute(:content)
    end

    it "should have commenter" do
      expect(observed_procedure_comment.commenter.class.name).to eq("User")
    end
  end
end
