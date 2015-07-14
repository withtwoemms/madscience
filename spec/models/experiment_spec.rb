require 'rails_helper'
describe Experiment do
  let!(:experiment) { build(:full_experiment) }

  it "has proper attributes" do
    [:name, :results, :conclusion].each do |attribute|
      expect(experiment).to have_attribute(attribute)
    end
  end

  it "belongs to project" do
    expect(experiment.project.class.name).to eq("Project")
  end

  it "belongs to an experimenter" do
    expect(experiment.experimenter.class.name).to eq("User")
  end

  it "experimenter is a staff member" do
    expect(experiment.experimenter.position.title).to eq("staff")
  end
end
