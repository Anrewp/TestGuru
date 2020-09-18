module TestPassagesHelper
  def passing_result_title_score(score)
    case score
    when 0..85
      ("<h2> You failed the Test </h2>
        <lable>Your score: </lable> <span class= 'red'>#{score}%</span>").html_safe
    else
      ("<h2> You passed the Test </h2>
        <lable>Your score: </lable> <span class= 'green'>#{score}%</span>").html_safe
    end
  end
end
