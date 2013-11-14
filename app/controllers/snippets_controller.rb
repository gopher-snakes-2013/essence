class SnippetsController < ApplicationController
  def create
    snippet = Snippet.new
    snippet.content = params[:snippet][:content]
    snippet.user_id = current_user.id || params[:snippet][:user_id]
    snippet.topic_id = params[:snippet][:topic_id]
    if snippet.save
      render :nothing => true
    else
      # puts "I shouldn't fail silently"
      render :nothing => true
    end
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    redirect_to :back
  end
end