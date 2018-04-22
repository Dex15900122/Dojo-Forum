100.times do |article|
  Article.create!(
    title: "Post title",
    replies_count: rand(00..20),
    viewed_count: rand(00..99)
  )
end


User.create!(
  email: 'admin@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  role: "site_admin"
  )