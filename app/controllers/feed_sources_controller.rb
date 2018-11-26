class FeedSourcesController < ApplicationController
  before_action :set_feed_source, only: [:show, :edit, :update, :destroy, :fetch]

  def fetch
    require "open-uri"
    doc = Nokogiri::XML(open(@feed_source.link))
    items = doc.css("item link").first(@feed_source.num_articles)
    items.each do |d|
      Item.create(link: d.text, feed_source_id: @feed_source.id)
    end
    redirect_to items_path
  end
  # GET /feed_sources
  # GET /feed_sources.json
  def index
    @feed_sources = FeedSource.all
  end

  # GET /feed_sources/1
  # GET /feed_sources/1.json
  def show
  end

  # GET /feed_sources/new
  def new
    @feed_source = FeedSource.new
  end

  # GET /feed_sources/1/edit
  def edit
  end

  # POST /feed_sources
  # POST /feed_sources.json
  def create
    @feed_source = FeedSource.new(feed_source_params)

    respond_to do |format|
      if @feed_source.save
        format.html { redirect_to @feed_source, notice: 'Feed source was successfully created.' }
        format.json { render :show, status: :created, location: @feed_source }
      else
        format.html { render :new }
        format.json { render json: @feed_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_sources/1
  # PATCH/PUT /feed_sources/1.json
  def update
    respond_to do |format|
      if @feed_source.update(feed_source_params)
        format.html { redirect_to @feed_source, notice: 'Feed source was successfully updated.' }
        format.json { render :show, status: :ok, location: @feed_source }
      else
        format.html { render :edit }
        format.json { render json: @feed_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_sources/1
  # DELETE /feed_sources/1.json
  def destroy
    @feed_source.destroy
    respond_to do |format|
      format.html { redirect_to feed_sources_url, notice: 'Feed source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_source
      @feed_source = FeedSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_source_params
      params.require(:feed_source).permit(:title, :link, :feed_type, :num_articles, :description, :category_id)
    end
end
