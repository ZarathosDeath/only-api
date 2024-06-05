class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.where(status: true)
    if params[:filter_title].present?
      @jobs = @jobs.where(title: params[:filter_title])
    elsif params[:filter_description].present?
      @jobs = @jobs.where(description: params[:filter_description])
    elsif params[:filter_skills].present?
      @jobs = @jobs.where(skills: params[:filter_skills])
    end
    render json: @jobs, status: :ok
  end

  def show
    render json: @job, status: :ok
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      render json: @job, status: :ok
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy!

    render json: @job, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:title, :description, :start_date, :end_date, :status, :skills, :recruiter_id)
  end
end
