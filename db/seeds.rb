# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
quests = [
    {title: 'Сколько будет 2 + 2',
     state: :active,
     description: 'Нужно сложить два числа и ответ написать',
     code: 'math',
     checker: :compare,
     points: 5,
     answer: {params: [4]}},
    {title: 'Сколько будет 2 + 5',
     state: :active,
     description: 'Нужно сложить два числа и ответ написать',
     code: 'math2',
     checker: :compare,
     points: 10,
     answer: {params: [7]}}
]

quests.each do |quest_data|
  Quest.create(quest_data)
end
