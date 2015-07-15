class CommentsController < ApplicationController
  before_action :user?
  before_action :set_project, except: [:new]
  before_action :set_experiment, except: [:new, :observation_create, :project_create]

  def new
    @comment = Comment.new
  end

  def observation_create
    @observation = Observation.find_by(id: params[:observation_id])
    @comment = @observation.comments.build(comment_params)

    if @comment.save
      redirect_to project_experiment_path(@project, @experiment)
    else
      render 'comments/new'
    end
  end

  def experiment_create
    @comment = @experiment.comments.build(comment_params)

    if @comment.save
      redirect_to project_experiment_path(@project, @experiment)
    else
      render 'comments/new'
    end
  end

  def project_create
    @comment = @project.comments.build(comment_params)

    if @comment.save
      redirect_to project_path(@project)
    else
      render 'comments/new'
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to source_path
    else
      render 'comments/edit'
    end
  end

  def destroy
    saved_source = source_path
    @comment.destroy
    redirect_to saved_source
  end

private
  def user?
    unless @user
      render_404
    end
  end

  def source_path
    if @comment.commentable.class.name == "Project"
      return project_path(@project)
    else
      return project_experiment_path(@project, @experiment)
    end
  end

  def set_project
    @project = Experiment.find_by(id: params[:project_id])
  end

  def set_experiment
    @experiment = Experiment.find_by(id: params[:experiment_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
