class TopicsController < ApplicationController

  def index
    @topics = current_user.topics
    @unaffiliated = current_user.snippets.where(topic_id: 0)
    @topic = Topic.new
  end

  def create
    topic = Topic.new
    topic.user_id = current_user.id || params[:topic][:user_id]
    topic.name = params[:topic][:name]
    if topic.save
      render :json => { new_topic: render_to_string(partial: "topic", locals: { topic: topic })}
    else
      # flash[:error] = topic.errors.full_messages
      render :json => { errors: topic.errors.full_messages }
      # redirect_to root_path
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