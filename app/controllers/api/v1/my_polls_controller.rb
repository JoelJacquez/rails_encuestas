class Api::V1::MyPollsController < ApplicationController
  before_action :authenticate, only: [:create, :destroy, :update]
  before_action :set_poll, only: [:show, :update, :destroy]
  before_action(only: [:update, :destroy]) { |controllador| controllador.authenticate_owner(@poll.user) }

  def index
    @polls = MyPoll.all
  end

  def show
  end

  def create
    @poll = @current_user.my_polls.new(my_polls_params)
    if @poll.save
      render 'api/v1/my_polls/show'
    else
      render json: { errors: @poll.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @poll.update(my_polls_params)
      render 'api/v1/my_polls/show'
    else
      render json: { errors: @poll.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @poll.destroy
      render json: {message: 'Fue eliminada la encuesta indicada'}
    else
      render json: { errors: @poll.errors }, status: :unprocessable_entity
    end
  end
  protected
  def authenticate_owner(owner)
    if owner != @current_user
      render json: {errors: 'No tienes autorizado realizar esta accion esta encuesta'}, status: 401
    end
  end

  private

  def set_poll
    @poll = MyPoll.find(params[:id])
  end
  def my_polls_params
    params.require(:poll).permit(:title, :description, :expires_at)
  end

end
