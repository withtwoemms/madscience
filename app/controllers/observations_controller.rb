class ObservationsController < ApplicationController
  before_action :authorized?
  before_action :set_experiment
  before_action :set_observation, only: [:edit, :update, :destroy]

  def new
    @observation = Observation.new
  end

  def procedure_create
    procedure = Procedure.find_by(id: params[:procedure_id])
    @observation = procedure.observations.build(observation_params)

    if @observation.save
      redirect_to project_experiment_path(@experiment.project, @experiment)
    else
      render 'observations/new'
    end
  end

  def experiment_create
    @observation = @experiment.observations.build(observation_params)

    if @observation.save
      redirect_to project_experiment_path(@experiment.project, @experiment)
    else
      render 'observations/new'
    end
  end

  def edit
  end

  def update
    if @observation.update_attributes(observation_params)
      redirect_to project_experiment_path(@experiment.project, @experiment)
    else
      render 'observations/edit'
    end
  end

  def destroy
    @observation.destroy
    redirect_to project_experiment_path(@experiment.project, @experiment)
  end

private
  def set_experiment
    @experiment = Experiment.find_by(id: params[:experiment_id])
  end

  def set_observation
    @observation = Observation.find_by(id: params[:id])
  end

  def authorized?
    unless experimenter?
      render_404
    end
  end

  def observation_params
    params.require(:observation).permit(:content)
  end
end
