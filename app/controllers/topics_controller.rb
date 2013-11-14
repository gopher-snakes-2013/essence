class TopicsController < ApplicationController

  def index
    @topics = current_user.topics
    @unaffiliated = current_user.unaffiliated_snippets
    @topic = Topic.new
  end

  def create
    new_topic = Topic.new
    new_topic.user_id = current_user.id || params[:topic][:user_id]
    new_topic.name = params[:topic][:name]
    if new_topic.save
      render :json => render_to_string(partial: "topic", locals: { topic: new_topic }).to_json
    else
      render :json => { errors: new_topic.errors.full_messages }.to_json
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    topic = Topic.find(params[:id])
    snippets = topic.snippets
    topic.destroy
    render :text => render_to_string(:partial => 'snippets', :locals => {:snippets => snippets})
  end
end