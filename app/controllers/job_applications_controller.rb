# frozen_string_literal: true

class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show update destroy]

  # GET /job_applications
  # GET /job_applications.json
  def index
    @job_applications = JobApplication.all
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show; end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      render :show, status: :created, location: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    if @job_application.update(job_application_params)
      render :show, status: :ok, location: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_application_params
    params.require(:job_application).permit(:user_id, :job_id, :custom_answers)
  end
end
