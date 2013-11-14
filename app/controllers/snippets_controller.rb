class SnippetsController < ApplicationController
  def create
    snippet = Snippet.new
    snippet.content = params[:snippet][:content]
    snippet.user_id = current_user.id || params[:snippet][:user_id]
    snippet.topic_id = params[:snippet][:topic_id]
    snippet.source_id = params[:snippet][:source_id]
    if snippet.save
      render :nothing => true
    else
      render :nothing => true
    end
  end

  def update
    snippet = Snippet.find(params[:snippet_id])
    snippet.update_attribute('topic_id', params[:topic_id])
    render :nothing => true
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    render :nothing => true
  end
end