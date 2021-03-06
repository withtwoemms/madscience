class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    unless @user
      render_404
    end
    @projects = Project.all
  end

  def show
    unless @user
      render_404
    end
  end

  def new
    unless @user
      render_404
    end
    @project = Project.new
  end

  def create
    unless @user
      render_404
    end
    @project = Projects.build(project_params)
    @project.creator = @user

    if @project.save
      redirect_to project_path(@project)
    else
      render new_project_path
    end
  end

  def edit
    unless creator?
      render_404
    end
  end

  def update
    if creator?
      if @project.update_attributes(project_params)
        redirect_to project_path(@project)
      else
        render edit_project_path(@project)
      end
    else
      render_404
    end
  end

  def destroy
    if creator?
      @project.destory
      redirect_to root_url
    else
      render_404
    end
  end

private
  def creator?
    @user.id == @project.creator.id
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :summary, :hypothesis)
  end
end
