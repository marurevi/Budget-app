# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.new(name: 'Mariana', email: 'mariana@email.com', password: '123456')
u.skip_confirmation!
u.save

g1 = Group.create(name: 'Family', icon: "👨‍👩‍👧‍👦​", user_id: u.id)
g2 = Group.create(name: 'Friends', icon: "🎉", user_id: u.id)
g3 = Group.create(name: 'Work', icon: "👔", user_id: u.id)

op1 = Operation.create(name: 'Food', amount: 10, user_id: u.id)
op2 = Operation.create(name: 'Doctor', amount: 15, user_id: u.id)
op3 = Operation.create(name: 'Rent', amount: 105, user_id: u.id)
op4 = Operation.create(name: 'Transport', amount: 25, user_id: u.id)
op5 = Operation.create(name: 'Entretaiment', amount: 55, user_id: u.id)

g1.operations << [op1, op2, op3]
g2.operations << [op1, op4, op5]