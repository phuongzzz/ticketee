class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      flash[:notice] = "Your project has been created."
      redirect_to @project
    else
      flash.now[:alert] = "Your project has not been created."
      render "new"
    end
  end

  private

  def project_params
    params.require(:project).permit :name, :description
  end
end
