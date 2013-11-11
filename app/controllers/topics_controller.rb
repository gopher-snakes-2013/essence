class TopicsController < ApplicationController

  def index
    @topics = current_user.topics
    @topic = Topic.new
  end

  def create
    topic = Topic.new
    topic.user_id = current_user.id || params[:topic][:user_id]
    topic.name = params[:topic][:name]
    if topic.save
      redirect_to root_path
    else
      flash[:error] = topic.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    topic = Topic.find(params[:id])
    snips = Snippet.where(topic_id: topic.id)
    snips.each do |snippet|
      snippet.update_attribute('topic_id', 0)
    end
    topic.destroy
    redirect_to root_path
  end
end