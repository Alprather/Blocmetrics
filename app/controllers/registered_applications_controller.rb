class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(parmas[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
    @registered_application.user = current_user
    if @registered_application.save
      redirect_to registered_applications_path, notice: 'Appplication was saved successfully.'
    else
      flash.now[:alert] = 'Error registering application. Please try again.'
      render :new
     end
  end

  def edit
    @registered_application = RegisteredApplication.find(parmas[:id])
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def destroy
    registered_application = RegisteredApplication.find(params[:id])
    registered_application.destroy
    if @registered_application.destroy
      redirect_to @registered_applications, notice: 'Appplication was deleted successfully.'
    else
      flash.now[:alert] = 'Error deleting application. Please try again.'
      redirect_to registered_applications_path, notice: 'Appplication was deleted successfully.'
     end
  end
end
