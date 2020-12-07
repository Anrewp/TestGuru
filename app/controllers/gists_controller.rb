class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    question = test_passage.current_question
    new_gist = GistQuestionService.new(question)
    result = new_gist.call

    gist = current_user.gists.new(question_id: question.id,
                                  url: result.html_url,
                                  hexdigest: result.html_url.split('/').last)
    flash_options = if new_gist.success? && gist.save
                      { notice: t('.success', url: gist.url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to test_passage, flash_options
  end
end
