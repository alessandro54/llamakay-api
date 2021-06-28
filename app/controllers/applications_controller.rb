# frozen_string_literal: true

class ApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show update destroy]

  # GET /applications
  # GET /applications.json
  def index
    @job_applications = Application.all
  end

  # GET /applications/1
  # GET /applications/1.json
  def show; end

  # POST /applications
  # POST /applications.json
  def create
    @job_application = Application.new(job_application_params)

    if @job_application.save
      render :show, status: :created, location: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    if @job_application.update(job_application_params)
      render :show, status: :ok, location: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @job_application.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job_application
    @job_application = Application.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_application_params
    params.require(:application).permit(:user_id, :job_id, :custom_answers)
  end
end
