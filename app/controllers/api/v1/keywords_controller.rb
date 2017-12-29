module Api
  module V1
  	class KeywordsController < ApplicationController
  	  skip_before_action :verify_authenticity_token
	  respond_to :json
	  #before_action :doorkeeper_authorize!
	  def index
	  	respond_with Keyword.all.order(keyword: :asc)
	  end

	  def import
	  	#binding.pry
	  	file = params.values[0].tempfile
	  	if file != nil
	  		Keyword.destroy_all
	  		Keyword.import(file) 
	  	end
	  	# redirect_to keywords_path
	  end

	  def search_keyword
	  	if params.present? && params[:search_keyword].present?
	  		respond_with Keyword.search(params[:search_keyword]) 
	  	end
	  end

	  def search_adwords_urls
	  	if params.present? && params[:search_adwords_urls].present?
 			respond_with Keyword.search_adwords_urls(params[:search_adwords_urls])
	  	end
	  end

	  def search_all_urls
	  	if params.present? && params[:search_url].present?
	  		respond_with Keyword.search_url(params[:search_url])
	  	end
	  end

	  def show
	  end
	end
  end
end