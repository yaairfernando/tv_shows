# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

group_one = Group.create(name: "Group 1", contact: "carl", email: "carl@gmail.com")
group_two = Group.create(name: "Group 2", contact: "john", email: "john@gmail.com")
group_three = Group.create(name: "Group 3", contact: "marl", email: "marl@gmail.com")

team_one = Team.create(status: :active, name: "Mind Benders", color: "#fe4", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", group_id: group_one.id)
team_two = Team.create(status: :active, name: "Capitalist Crew", color: "#ef4", description: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using", group_id: group_two.id)
team_three = Team.create(status: :suspended, name: "Innovation Geeks", color: "#r4t", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised", group_id: group_three.id)
team_four = Team.create(status: :active, name: "Miracle Workers", color: "#gf5", description: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.")
team_five = Team.create(status: :deprecated, name: "Wind Chasers", color: "#fgt", description: " All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.")

user_one = User.create(status: :active, name: "Paul", email: "paul@gmail.com", team_id: team_one.id)
user_two = User.create(status: :active, name: "Carlos", email: "carlos@gmail.com", team_id: team_three.id)
user_three = User.create(status: :blocked, name: "Ricardo", email: "ricardo@gmail.com", team_id: team_five.id)
user_four = User.create(status: :active, name: "Mia", email: "mia@gmail.com")

tv_show_one = TvShow.create(name: "Save Me", show_type: "Action")
tv_show_two = TvShow.create(name: "Elizabeth is missing", show_type: "Reality")
tv_show_three = TvShow.create(name: "Between the World and me", show_type: "Action")
tv_show_four = TvShow.create(name: "Euphoria Special Episode", show_type: "Adventure")

review_type_one = ReviewType.create(name: "General", code: "RRV")
review_type_two = ReviewType.create(name: "Full", code: "RRF")


# TV SHOW ONE
1000.times do
  tv_show_one.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_one.id,
    scheduled_date: Time.now + 9.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_one.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 1.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_one.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 1.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

5000.times do
  tv_show_one.reviews.create(
    title: "It could get better",
    status: :denied,
    description: "It is good but it could be better.",
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_one.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_two.id,
    scheduled_date: Time.now + 2.days,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 30.minutes,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 30.minutes,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_one.reviews.create(
    title: "This is a great show",
    status: :denied,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_three.id,
    scheduled_date: Time.now + 10.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_three.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_one.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end




# TV SHOW TWO
1000.times do
  tv_show_two.reviews.create(
    title: "This is a great show",
    status: :denied,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_one.id,
    scheduled_date: Time.now + 2.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_two.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_one.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

5000.times do
  tv_show_two.reviews.create(
    title: "It could get better",
    status: :cancelled,
    description: "It is good but it could be better.",
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 10.minutes,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

5000.times do
  tv_show_two.reviews.create(
    title: "It could get better",
    status: :accepted,
    description: "It is good but it could be better.",
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 10.minutes,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_two.reviews.create(
    title: "This is a great show",
    status: :denied,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_two.id,
    scheduled_date: Time.now + 6.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_two.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_two.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_three.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_two.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_three.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 5.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end


1500.times do
  tv_show_two.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 3.days,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_two.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 3.days,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end




# TV SHOW THREE
1000.times do
  tv_show_three.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_three.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_one.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 3.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

5000.times do
  tv_show_three.reviews.create(
    title: "It could get better",
    status: :accepted,
    description: "It is good but it could be better.",
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 8.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_three.reviews.create(
    title: "This is a great show",
    status: :denied,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_two.id,
    scheduled_date: Time.now + 5.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_three.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 7.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_three.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_three.id,
    scheduled_date: Time.now + 2.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_three.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_three.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_three.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_three.id,
    review_type_id: review_type_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end


1500.times do
  tv_show_three.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 4.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end





# TV SHOW FOUR
1000.times do
  tv_show_four.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_one.id,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_four.reviews.create(
    title: "This is a really bad show",
    status: :denied,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_one.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 9.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

5000.times do
  tv_show_four.reviews.create(
    title: "It could get better",
    status: :accepted,
    description: "It is good but it could be better.",
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 4.days,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_four.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_two.id,
    scheduled_date: Time.now + 2.days,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_four.reviews.create(
    title: "This is a really bad show",
    status: :cancelled,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 9.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_four.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_two.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 9.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1000.times do
  tv_show_four.reviews.create(
    title: "This is a great show",
    status: :accepted,
    description: "At first it was not as good as i was expecting but after finish it, I was happy with it.",
    user_id: user_three.id,
    scheduled_date: Time.now + 4.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end

1500.times do
  tv_show_four.reviews.create(
    title: "This is a really bad show",
    status: :denied,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_three.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 6.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end


1500.times do
  tv_show_four.reviews.create(
    title: "This is a really bad show",
    status: :accepted,
    description: "It is a really bad show. do not watch it!!.",
    user_id: user_four.id,
    review_type_id: review_type_one.id,
    scheduled_date: Time.now + 2.hours,
    votes: Faker::Number.number(digits: 2),
    revenue: Faker::Number.number(digits: 3)
  )
end