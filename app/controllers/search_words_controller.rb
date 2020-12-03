require 'google-api-client'

class SearchWordsController < ApplicationController
  before_action :set_search_word, only: [:show, :edit, :update, :destroy]

  # GET /search_words
  # GET /search_words.json
  def index
    @search_words = SearchWord.all
// https://cloud.google.com/translate/docs/quickstarts?csw=1
    require 'google/apis/drive_v2'
    client = Google::APIClient.new(:key =>  )
    translate = client.discovered_api('translate', 'v2')
    @result = client.execute(
      :api_method => translate.translations.list,
      :parameters => {
        'format' => 'text',
        'source' => 'en',
        'target' => 'es',
        'q' => 'The quick brown fox jumped over the lazy dog.'
      }
    )

  end

  # GET /search_words/1
  # GET /search_words/1.json
  def show
  end

  # GET /search_words/new
  def new
    @search_word = SearchWord.new
  end

  # GET /search_words/1/edit
  def edit
  end

  # POST /search_words
  # POST /search_words.json
  def create
    @search_word = SearchWord.new(search_word_params)

    respond_to do |format|
      if @search_word.save
        format.html { redirect_to @search_word, notice: 'Search word was successfully created.' }
        format.json { render :show, status: :created, location: @search_word }
      else
        format.html { render :new }
        format.json { render json: @search_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_words/1
  # PATCH/PUT /search_words/1.json
  def update
    respond_to do |format|
      if @search_word.update(search_word_params)
        format.html { redirect_to @search_word, notice: 'Search word was successfully updated.' }
        format.json { render :show, status: :ok, location: @search_word }
      else
        format.html { render :edit }
        format.json { render json: @search_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_words/1
  # DELETE /search_words/1.json
  def destroy
    @search_word.destroy
    respond_to do |format|
      format.html { redirect_to search_words_url, notice: 'Search word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_word
      @search_word = SearchWord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def search_word_params
      params.require(:search_word).permit(:word, :isSearched?)
    end
end
