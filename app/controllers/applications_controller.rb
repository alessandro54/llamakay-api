# frozen_string_literal: true

class ApplicationsController < ApplicationController

  before_action :authenticate_user!, only: %i[index show create update destroy]
  before_action :set_application, only: %i[show update destroy]

  # GET /applications
  # GET /applications.json
  def index
    @applications = ApplicationService.get_applications(Session.user)
  end

  # GET /applications/1
  # GET /applications/1.json
  def show; end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)

    if @application.save
      render :show, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    if @application.update(application_params)
      render :show, status: :ok, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_application
    @application = Application.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def application_params
    params.require(:application).permit(:user_id, :job_id, custom_answers: {})
  end
end
