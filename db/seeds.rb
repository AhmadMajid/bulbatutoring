10.times do |i|
  tutor = Tutor.create!(
    name: Faker::Lorem.word,
    headline: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs(number: 30).join(" "),
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: "United States",
    price: Money.from_amount((25..100).to_a.sample)
  )

  tutor.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "tutor_#{i + 1}.png")), filename: tutor.name)


  (1..5).to_a.sample.times do
    Review.create(reviewable: tutor, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
  end
end
