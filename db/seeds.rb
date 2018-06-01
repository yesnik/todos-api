# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

user = User.create name: 'Kenny', email: 'kenny@mail.ru', password: '123'

50.times do
  todo = Todo.create(title: Faker::Lorem.word, created_by: user.id)
  todo.items.create(name: Faker::Lorem.word, done: false)
end
