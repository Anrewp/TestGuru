class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[new create index]
  before_action :find_question, only: %i[show destroy edit update]

  def index; end

  def new; end

  def show; end

  def edit; end

  def create
    @question = @test.questions.build(question_params)

    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
