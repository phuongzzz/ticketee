class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @ticket = @project.tickets.build
  end

  def create
    @ticket = @project.tickets.build ticket_params
    @ticket.author = current_user

    if @ticket.save
      flash[:notice] = "Your ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = "Your ticket has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @ticket.update ticket_params
      flash[:notice] = "Your ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = "Your ticket has not been updated."
      render "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Your ticket has been deleted."

    redirect_to @project
  end

  private

  def set_project
    @project = Project.find params[:project_id]
  end

  def set_ticket
    @ticket = @project.tickets.find params[:id]
  end

  def ticket_params
    params.require(:ticket).permit :name, :description
  end
end
