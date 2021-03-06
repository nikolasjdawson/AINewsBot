class NewsSourcesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]
  before_action :set_news_source, only: [:show, :edit, :update, :destroy, :like]
  invisible_captcha only: [:create, :update], honeypot: :subtitle

  # GET /news_sources
  # GET /news_sources.json
  def like
    Like.create(news_source_id: @news_source.id, liker: @liker)
    # @news_source.update(likes: @new_count)
    @new_count = @news_source.likes.count
  end

  def index
    @news_sources = NewsSource.all
  end

  # GET /news_sources/1
  # GET /news_sources/1.json
  def show
  end

  # GET /news_sources/new
  def new
    @news_source = NewsSource.new
  end

  # GET /news_sources/1/edit
  def edit
  end

  # POST /news_sources
  # POST /news_sources.json
  def create
    @news_source = NewsSource.new(news_source_params)

    respond_to do |format|
      if @news_source.save
        # @news_source.update(likes: 1)
        NewsAlertJob.new.perform(@news_source.id)
        format.js
        # format.html { redirect_to @news_source, notice: 'News source was successfully created.' }
        # format.json { render :show, status: :created, location: @news_source }
      else
        format.html { render :new }
        format.json { render json: @news_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news_sources/1
  # PATCH/PUT /news_sources/1.json
  def update
    respond_to do |format|
      if @news_source.update(news_source_params)
        format.html { redirect_to news_sources_path, notice: 'News source was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_source }
      else
        format.html { render :edit }
        format.json { render json: @news_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_sources/1
  # DELETE /news_sources/1.json
  def destroy
    @news_source.destroy
    respond_to do |format|
      format.html { redirect_to news_sources_url, notice: 'News source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_source
      @news_source = NewsSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_source_params
      params.require(:news_source).permit(:is_accepted, :link, :title)
    end
end
