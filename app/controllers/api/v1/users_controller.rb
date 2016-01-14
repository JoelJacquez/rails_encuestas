class Api::V1::UsersController < ApplicationController
  # POST  /users
  def create
    #params = { auth = { provider: 'facebook', uid: '34bru53i' } }
    # @user = User.from_omniauth(auth_params)
    if !params[:auth]
      render json: { error: 'auth params is missing'}
    else
      @user = User.from_omniauth(params[:auth])

      @token = @user.tokens.create()

      render "api/v1/users/show"
    end
  end

  def auth_params
    params.require(:auth).permit_params(:provider, :uid, :info)
  end
end
