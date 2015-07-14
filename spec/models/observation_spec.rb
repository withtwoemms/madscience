require 'rails_helper'
describe Observation do
  let!(:experiment_observation) { build(:observed_experiment) }
  let!(:procedure_observation) { build(:observed_procedure) }

  describe 'Experiment Observation' do
    it "Should belong to the Observation class" do
      expect(experiment_observation.class.name).to eq("Observation")
    end

    it "Should belong to an experiment" do
      expect(experiment_observation.observable.class.name).to eq("Experiment")
    end

    it "Should have content" do
      expect(experiment_observation).to have_attribute(:content)
    end

    it "Should have an experimenter" do
      expect(experiment_observation.observable.experimenter.class.name).to eq("User")
    end

    it "Experimenter should be staff" do
      expect(experiment_observation.observable.experimenter.position.title).to eq("staff")
    end
  end

  describe 'Procedure Observation' do
    it "Should belong to the Observation class" do
      expect(procedure_observation.class.name).to eq("Observation")
    end

    it "Should belong to a procedure" do
      expect(procedure_observation.observable.class.name).to eq("Procedure")
    end

    it "Should have content" do
      expect(procedure_observation).to have_attribute(:content)
    end

    it "Should have an experimenter" do
      expect(procedure_observation.observable.experiment.experimenter.class.name).to eq("User")
    end

    it "Should have an experimenter" do
      expect(procedure_observation.observable.experiment.experimenter.position.title).to eq("staff")
    end
  end
end
