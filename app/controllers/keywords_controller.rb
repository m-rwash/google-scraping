class KeywordsController < ApplicationController
  def index
  	@keywords = Keyword.all
  end

  def import
  	
  	if params[:file] != nil
  		Keyword.destroy_all
  		Keyword.import(params[:file]) 
  	end
  	redirect_to keywords_path

  end

  def show
  end

end
