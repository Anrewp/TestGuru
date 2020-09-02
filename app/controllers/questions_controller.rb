class QuestionsController < ApplicationController
  before_action :find_test, except: %i[show destroy]
  before_action :find_question, only: %i[show destroy]

  def index
    @questions = find_test.questions
  end

  def new; end

  def create
    @question = find_test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def find_question
    @question ||= Question.find(params[:id])
  end

  def find_test
    @test ||= Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end