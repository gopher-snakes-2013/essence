class SourcesController < ApplicationController
  def index
  end

  def show
    @snippet = Snippet.new
  end
end