class KeywordsController < ApplicationController
  before_action :authorize

  def index
  	@keywords = Keyword.all.order(keyword: :asc)
  	@keywords = Keyword.search_keyword(params[:search_keyword]) if params[:search_keyword].present?
  	@keywords = Keyword.search_adwords_urls(params[:search_adwords_urls]) if params[:search_adwords_urls].present?
  	@keywords = Keyword.search_url(params[:search_url]) if params[:search_url].present?
  	@count = @keywords.count
  end

  def import
  	if params[:file] != nil
  		Keyword.import(params[:file]) 
  	end
  	redirect_to keywords_path
  end

  def show
  end

end
