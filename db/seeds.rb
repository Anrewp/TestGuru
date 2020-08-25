# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: 'Andrew', email: 'anrewp1991@gmail.com')
category = Category.create(title: 'default category')
test = category.tests.create(title: 'default category', author_id: user.id)
question = test.questions.create(body: 'default test question')
question.create_answer(body: 'default test answer')
user.user_tests.create(test_id: test.id)
