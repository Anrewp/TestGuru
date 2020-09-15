module TestsHelper
  def test_hardnes(level)
    case level
    when 0..1 then 'easy'
    when 2..4 then 'medium'
    when 5.. then  'hard'
    end
  end
end
