unless Rails.env.production?
  10.times do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(8)
    )

    Random.new.rand(5).times do
      blog = Blog.new(
        title: Faker::Lorem.sentence(5, true),
        content: Faker::Lorem.paragraph(5, true),
        published: true,
        published_date: Time.now
      )
      blog.user = user
      blog.save!
    end
  end
end