class TopicsController < ApplicationController

  def index
    @topics = current_user.topics
    @topic = Topic.new
  end

  def new
  end

  def create
    topic = Topic.new
    topic.user_id = current_user.id
    topic.name = params[:topic][:name]

    if topic.save
      redirect_to root_path
    else
      session['errors'] = topic.errors.full_messages
      redirect_to root_path
    end
  end

end