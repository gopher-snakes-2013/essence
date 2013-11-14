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
    source.title = params[:source][:title]
    source.url = params[:source][:url]

    if source.save
      render :json => render_to_string(partial: "new_source_url", locals: { source: source }).to_json
    else
      render :json => { errors: source.errors.full_messages }.to_json
    end
  end

  def open_pdf
    source = current_user.sources.where(url: params[:url]).first
    unless source
      source = current_user.sources.new
      source.title = params[:title] || params[:url]
      source.url = params[:url]
      source.save!
    end
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