class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i[show edit update destroy]

  def index
    @submissions = Submission.all
    render json: @submissions, status: :ok
  end

  def show
    render json: @submission, status: :ok
  end

  def create
    @submission = Submission.new(submission_params)
    existing_submission = Submission.find_by(email: @submission.email, job: @submission.job_id)

    if existing_submission.present?
      render json: { error: 'You cannot submit more than one time to the same job.' },
             status: :unprocessable_entity
    elsif @submission.save
      render json: @submission, status: :created
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def update
    if @submission.update(submission_params)
      render json: @submission, status: :ok
    else
      render json: @submission.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @submission.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_submission
    @submission = Submission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def submission_params
    params.require(:submission).permit(:name, :email, :mobile_phone, :resume, :job_id)
  end
end
