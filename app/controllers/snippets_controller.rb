class SnippetsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @snippet = Snippet.new
    @snippet.content = params[:snippet][:content]
    @snippet.topic_id = params[:snippet][:topic_id]
    @snippet.user_id = current_user.id || params[:snippet][:user_id]
    puts "*"*80
    puts @snippet
    @snippet.save
    render json: @snippet
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    redirect_to :back
  end

end