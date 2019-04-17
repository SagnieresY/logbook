# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  test_user = User.create(email: 't@t.com', password:'123456')
  test_user.save!

  engine_type_array = ["single", "multi"]
  command_type_array = ["PIC", "Dual", "Co-pilot"]
  random_boolean = [true, false]

  14.times do
    f = Flight.new(date: Time.now,
                  from: "cyhu",
                  to: "cyhu",
                  aircraft_type: "C150",
                  aircraft_registration: "CGSAG",
                  engine_type: engine_type_array.sample,
                  cross_country: random_boolean.sample,
                  command_type: command_type_array.sample,
                  pic_name: "h.roche",
                  copi_name: "y.sagnieres",
                  day_time: rand(0..4),
                  night_time: rand(0..1),
                  simulator_time: rand(0..2),
                  actual_imc: rand(0..1),
                  hood: rand(1..2),
                  takeoffs_landings: 1,
                  user: test_user)
    f.save!
  end


