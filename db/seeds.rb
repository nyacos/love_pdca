# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(
  email: 'admin@example.com',
  password: 'password',
  is_admin: true
)

Plan.create(title: "マッチングアプリで無差別に足跡をつける", content: "マッチングアプリで無差別に足跡をつける。（1日の上限まで）", category_id: "2")
Plan.create(title: "いいねが来た人の中から、気になる人にいいねを返す", content: "いいねが来た人の中から、気になる人にいいねを返す", category_id: "3")
