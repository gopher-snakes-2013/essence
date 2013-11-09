class TopicsController < ApplicationController

  def index
  end

  def new
  end

  #Our actual feature will require a different implementation of topics#create
  #Params will have symbols instead of strings
  def create
    topic = Topic.new
    topic.user_id = params['topic']['user_id'].to_i
    topic.name = params['topic']['name']

    if topic.save
      redirect_to root_path
    else
      redirect_to new_topic_path
    end
  end

end