class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @recruiter = Recruiter.find_by_email(params[:email])
    if @recruiter&.authenticate(params[:password])
      token = JsonWebToken.encode(recruiter_id: @recruiter.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @recruiter.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
