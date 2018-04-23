100.times do |article|
  Article.create!(
    title: "Post title",
    replies_count: rand(00..20),
    viewed_count: rand(00..99),
    user_id: 1,
    content: "wewqew r r43t 545yth  htrht rg refrefrefwedwdewdew 32r2323r23  2r32r23r 2r32r32r r23r32r32r32r32r32r23 r2",
  )
end


User.create!(
  email: 'admin@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  role: "site_admin"
  )