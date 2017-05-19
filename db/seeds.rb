require 'random_data'

 # Create Posts
 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

puts "#{Post.count}"
 new_post = Post.find_or_create_by(title: "New title", body: "New body")
puts "#{Post.count}"
puts "#{Comment.count}"
 Comment.find_or_create_by(body: "New comment body", post: new_post)
puts "#{Comment.count}"

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
