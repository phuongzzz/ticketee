class Admin::ProjectsController < Admin::ApplicationController
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

  def destroy
    @project = Project.find params[:id]
    @project.destroy

    flash[:notice] = "Your project has been deleted."
    redirect_to projects_path
  end

  private


  def project_params
    params.require(:project).permit :name, :description
  end
end
