class ExperimentsController < ApplicationController
  before_action :user?
  before_action :set_experiment, except: [:new, :create]
  before_action :set_project

  def show
  end

  def conclusions
  end

  def results
  end

  def observations
  end

  def procedures
  end

  def new
    @experiment = Experiment.new
  end

  def create
    if is_staff?
      @experiment = @project.experiments.build(experiment_params)

      if @experiment.save
        redirect_to project_experiment_path(@project, @experiment)
      else
        render new_project_experiment_path(@project)
      end
    else
      render_404
    end
  end

  def edit
    unless experimenter?
      render_404
    end
  end

  def update
    if experimenter?
      if @experiment.update_attributes(experiment_params)
        redirect_to project_experiment_path(@project, @experiment)
      else
        render edit_project_experiment_path(@project, @experiment)
      end
    else
      render_404
    end
  end

  def destroy
    if experimenter?
      @experiment.destroy
      redirect_to project_path(@project)
    else
      render_404
    end
  end

private
  def user?
    unless @user
      render_404
    end
  end

  def is_staff?
    @user.position.title == "staff"
  end

  def set_experiment
    @experiment = Experiment.find_by(id: params[:id])
  end

  def set_project
    @project = Project.find_by(id: params[:project_id])
  end

  def experimenter?
    @user.id == @experiment.experimenter.id
  end

  def experiment_params
    params.require(:experiment).permit(:name, :results, :conclusion)
  end
end
