class SourcesController < ApplicationController
  def index
  end

  def show
    @snippet = Snippet.new
    @topics = current_user.topics
  end
end