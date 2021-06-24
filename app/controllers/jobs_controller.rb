# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show update delete]
  before_action :set_job, only: %i[show update destroy]

  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show; end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render :show, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render :show, status: :ok, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:company_id, :description, :seniority, :active, :custom_questions)
  end
end
