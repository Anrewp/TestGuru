class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: 'should be uniq' }

  scope :by_category, ->(category) { includes(:category).where(categories: { title: category }) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: (5..)) }

  def self.names_by_category(category)
    by_category(category).order(id: :desc).pluck(:title)
  end
end
