class SnippetsController < ApplicationController

  def index
  end

  def new
  end

  def create
    topic = Topic.find params[:snippet][:topic_id]
    snippet = topic.snippets.build
    snippet.content = params[:snippet][:content]
    snippet.user = current_user
    snippet.save
    render :nothing => true
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    redirect_to :back
  end

end