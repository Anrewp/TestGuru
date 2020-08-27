class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  # scope :names_by_category, (lambda do |category|
  #   where(categories: { title: category })
  #   .order(id: :desc)
  #   .includes(:category)
  #   .pluck(:title)
  # end)

  def self.names_by_category(category)
    includes(:category).where(categories: { title: category }).order(id: :desc).pluck(:title)
  end
end
