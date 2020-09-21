module TestPassagesHelper
  def passing_result_title_score(test_passage)
    score = test_passage.score
    if test_passage.success?
      "<h2> You passed the Test </h2>
       <lable>Your score: </lable> <span class= 'green'>#{score}%</span>".html_safe
    else
      "<h2> You failed the Test </h2>
       <lable>Your score: </lable> <span class= 'red'>#{score}%</span>".html_safe
    end
  end
end
