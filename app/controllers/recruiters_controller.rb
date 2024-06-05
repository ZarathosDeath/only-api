class RecruitersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_recruiter, except: %i[create index]

  def index
    @recruiters = Recruiter.all
    render json: @recruiters, status: :ok
  end

  def show
    render json: @recruiter, status: :ok
  end

  def create
    @recruiter = Recruiter.new(user_params)
    if @recruiter.save
      render json: @recruiter, status: :created
    else
      render json: { errors: @recruiter.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    unless @recruiter.update(user_params)
      render json: { errors: @recruiter.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @recruiter.destroy
  end

  private

  def find_recruiter
    @recruiter = Recruiter.find_by_email!(params[:_email])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Recruiter not found' }, status: :not_found
  end

  def recruiter_params
    params.permit(
     :name, :email, :password, :password_confirmation
    )
  end
end
