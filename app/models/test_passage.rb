class TestPassage < ApplicationRecord
  PASSING_SCORE_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  def accept!(answer_ids)
    increment(:correct_questions) if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def score
    ((correct_questions.to_f / test.questions.count) * 100).to_i
  end

  def question_number
    test.questions.order(:id).ids.index(current_question.id) + 1
  end

  def success?
    score > PASSING_SCORE_PERCENT
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_update_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
