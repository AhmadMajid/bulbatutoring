10.times do |i|
  tutor = Tutor.create!(
    name: Faker::Lorem.word,
    headline: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    address_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: "United States",
    price: Money.from_amount((25..100).to_a.sample)
  )

  tutor.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "tutor_#{i + 1}.png")), filename: tutor.name)
end
