# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Bob', email: 'bob@mail.ru', password: '12345678', password_confirmation: '12345678')
category = Category.create(title: 'default category')
test = category.tests.create(title: 'default test', author_id: user.id)
question = test.questions.create(body: 'test question ?')
question.answers.create(body: 'test answer 1')
user.test_passages.create(test_id: test.id)
