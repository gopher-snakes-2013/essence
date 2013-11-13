class SourcesController < ApplicationController
  layout 'pdf_viewer', :only => [:show]
  def index
  end

  def show
    @snippet = Snippet.new
    @sorted_topics = current_user.topics.sort_by { |topic| topic.name }
  end
end