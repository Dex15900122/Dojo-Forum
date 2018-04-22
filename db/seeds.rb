100.times do |article|
  Article.create!(
    title: "Post title",
    replies_count: rand(00..99),
    viewed_count: rand(00..99)
  )
end