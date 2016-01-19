class Api::V1::AnswersController < Api::V1::MasterApiController
  before_action :authenticate, except: [:index, :show]
  before_action :set_answer, only: [:show, :update, :delete]
  before_action :set_poll #, only: [:create]
  before_action(only: [:update, :destroy, :create]) { |controllador| controllador.authenticate_owner(@poll.user) }


  # POST /polls/1/answers
  def create
    @answer = Answer.new(answers_params)
    if @answer.save
      render template: "api/v1/answers/show"
    else
      render json: { error: @answer.errors }, status: :unprocessable_entity
    end
  end
  # PATCH PUT /polls/1/questions/2
  def update
    if @answer.update(answer_params)
      render template: "api/v1/answers/show"
    else
      render json: { error: @answer.errors }, status: :unprocessable_entity
    end
  end
  # DELETE /polls/1/questions
  def delete
    @answer.destroy
    head :ok
  end

  private

  def answers_params
    params.require(:question).permit(:description)
  end

  def set_poll
    @poll = MyPoll.find(params[:poll_id])
  end

  def set_answer
    @question = Question.find(params[:id])
  end
end
