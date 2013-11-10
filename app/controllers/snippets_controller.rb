class SnippetsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @snippet = Snippet.new
    @snippet.content = params[:snippet][:content]
    @snippet.topic_id = params[:snippet][:topic_id]
    @snippet.save
    redirect_to root_path
  end

end