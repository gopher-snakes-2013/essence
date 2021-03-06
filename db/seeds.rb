require 'faker'

def new_snippet(topic_id, user_id)
  snippet = Snippet.new
  snippet.topic_id = topic_id
  snippet.user_id = user_id
  snippet.content = Faker::Company.bs
  snippet.save
  snippet
end

def new_topic(user_id)
  topic = Topic.new
  topic.user_id = user_id
  topic.name = Faker::Company.catch_phrase
  topic.save
  5.times { topic.snippets << new_snippet(topic.id, user_id) }
  topic
end

def add_topics_to_user(id)
  user = User.find(id)
  5.times { user.topics << new_topic(id)}
end

user = User.new
user.email = 'jon@jon.jon'
user.password = 'abc123'
user.save

this_user = User.find_by_email('jon@jon.jon')

add_topics_to_user(this_user.id)