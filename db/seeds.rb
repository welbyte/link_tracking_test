# Clear existing posts
Post.destroy_all

# Create an array of external websites
external_sites = [
  'https://rubyonrails.org',
  'https://github.com',
  'https://developer.mozilla.org',
  'https://www.ruby-lang.org',
  'https://tailwindcss.com'
]

# Create 10 posts with interlinks and external links
10.times do |i|
  title = "Post #{i + 1}: #{Faker::Lorem.sentence(word_count: 3)}"

  # Generate body content with internal and external links
  body = ""

  # Add paragraphs
  3.times do
    body += "<p>#{Faker::Lorem.paragraph(sentence_count: 3)}</p>"
  end

  # Add an internal link (if not the first post)
  if i > 0
    internal_link_id = rand(1..i)
    body += "<p>Check out <a href='/posts/#{internal_link_id}'>this related post</a>.</p>"
  end

  # Add an external link
  external_link = external_sites.sample
  body += "<p>For more information, visit <a href='#{external_link}' target='_blank'>this external resource</a>.</p>"

  # Create the post
  Post.create!(
    title: title,
    body: ActionText::RichText.new(body: body)
  )
end

puts "Created #{Post.count} posts with interlinks and external links."
