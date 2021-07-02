# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :authenticate_user!, only: %i[index update destroy]
  before_action :set_job, only: %i[show update destroy]

  def index
    @jobs = Job.all
  end

  def show; end

  def create
    @job = Job.new(job_params)

    if @job.save
      render :show, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render :show, status: :ok, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:company_id, :description, :seniority, :active, :custom_questions)
  end

  def belongs_to_company?
    unless UserService.belongs_to_company?(@job)
      render json: { message: 'You must belong to that company to see that' }, status: :forbidden
    end
  end
end
