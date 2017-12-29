class KeywordsController < ApplicationController
  before_action :authorize

  def index
  	@keywords = Keyword.all.order(keyword: :asc).page(params[:page])
                .paginate(:page => params[:page], :per_page => 10)

  	@keywords = Keyword.search_keyword(params[:search_keyword]).page(params[:page])
                .paginate(:page => params[:page], :per_page => 10) if params[:search_keyword].present?

  	@keywords = Keyword.search_adwords_urls(params[:search_adwords_urls]).page(params[:page])
                .paginate(:page => params[:page], :per_page => 10) if params[:search_adwords_urls].present?

  	@keywords = Keyword.search_url(params[:search_url]).page(params[:page])
                .paginate(:page => params[:page], :per_page => 10) if params[:search_url].present?
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
