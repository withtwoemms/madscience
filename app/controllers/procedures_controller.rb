class ProceduresController < ApplicationController
  before_action :set_experiment
  before_action :set_procedure, only: [:edit, :update, :destroy]

  def new
    unless experimenter?
      render_404
    end
    @procedure = Procedure.new
  end

  def create
    unless experimenter?
      render_404
    end
    @procedure = @experiment.procedures.build(procedure_params)

    if @procedure.save
      redirect_to project_experiment_path(@experiment.project, @experiment)
    else
      render new_project_experiment_procedure(@experiment.project, @experiment)
    end
  end

  def edit
    unless experimenter?
      render_404
    end
  end

  def update
    unless experimenter?
      render_404
    end
    if @procedure.update_attributes(procedure_params)
      redirect_to project_experiment_path(@experiment.project, @experiment)
    else
      render edit_project_experiment_procedure_path(@experiment.project, @experiment)
    end
  end

  def destroy
    unless experimenter?
      render_404
    end
    @procedure.destroy
    redirect_to project_experiment_path(@experiment.project, @experiment)
  end

private
  def set_procedure
    @procedure = Procedure.find_by(id: params[:id])
  end

  def set_experiment
    @experiment = Experiment.find_by(id: params[:experiment_id])
  end

  def experimenter?
    @user.id == @experiment.experimenter.id
  end

  def procedure_params
    params.require(:procedure).permit(:instructions)
  end
end
