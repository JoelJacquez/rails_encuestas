class Api::V1::QuestionsController < Api::V1::MasterApiController
  before_action :authenticate, except: [:index, :show]
  before_action :set_question, only: [:show, :update, :delete]
  before_action :set_poll #, only: [:create]
  before_action(only: [:update, :destroy, :create]) { |controllador| controllador.authenticate_owner(@poll.user) }

  # GET /polls/1/questions
  def index
    @questions = @poll.questions
  end
  # GET /polls/1/questions/2
  def show
  end
  # POST /polls/1/questions
  def create
    @question = @poll.questions.new(question_params)
    if @question.save
      render template: "api/v1/question/show"
    else
      render json: { error: @question.errors }, status: :unprocessable_entity
    end
  end
  # PATCH PUT /polls/1/questions/2
  def update
    if @question.update(question_params)
      render template: "api/v1/questions/show"
    else
      render json: { error: @question.errors }, status: :unprocessable_entity
    end
  end
  # DELETE /polls/1/questions
  def delete
    @question.destroy
    head :ok
  end

  private

  def question_params
    params.require(:question).permit(:description)
  end

  def set_poll
    @poll = MyPoll.find(params[:poll_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
