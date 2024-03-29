user_pictures = []

6.times do
  user_pictures << URI.parse(Faker::LoremFlickr.image).open
end

me = User.create(email: "john@domain.com", password: "password")
me.profile.update(first_name: "John", last_name: "Smith")
me.profile.picture.attach(io: user_pictures[0], filename: "#{me.full_name}.jpg")


5.times do |i|
  user = User.create(email: Faker::Internet.email, password: "password")
  user.profile.update(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.profile.picture.attach(io: user_pictures[i + 1], filename: "#{user.full_name}.jpg")
end

10.times do |i|
  tutor = Tutor.create!(
    user: me,
    name: Faker::Lorem.word,
    headline: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs(number: 30).join(" "),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country_code: "US",
    price: Money.from_amount((25..100).to_a.sample)
  )

  tutor.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "tutor_#{i + 1}.png")), filename: tutor.name)

  (1..5).to_a.sample.times do
    Review.create(reviewable: tutor, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph, user: User.all.sample)
  end
end
