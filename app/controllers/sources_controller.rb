require 'open-uri' # needed for proxy

class SourcesController < ApplicationController
  layout 'pdf_viewer', :only => [:show]
  def index
    @sources = current_user.sources
  end

  def show
    @source = Source.find(params[:id])
    # use our proxy to get around CORS limitations in PDF.js
    @cors_safe_url = "#{proxy_path}?url=#{@source.url}"
    @snippet = Snippet.new
    @sorted_topics = current_user.topics.sort_by { |topic| topic.name }
  end

  def create
    source = current_user.sources.new
    source.title = params[:title] || params[:url]
    source.url = params[:url]
    source.save
    redirect_to source
  end

  # PDF.js requests will go through this proxy
  def proxy
    uri = URI.parse(params[:url])
    open(uri.to_s) do |f|
      # TODO: instead of using f.read below, perhaps read it a bit at a time and
      # stream it a bit at a time. Look into response chunking for Rails.
      data = f.read
      # disposition: :inline means not an attachment -- render right to browser
      send_data data, type: f.content_type, disposition: :inline
    end
  end
end