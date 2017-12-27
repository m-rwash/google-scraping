module Api
  module V1
  	class KeywordsController < ApplicationController
  	  skip_before_action :verify_authenticity_token
	  respond_to :json
	  def index
	  	respond_with Keyword.all
	  end

	  def import
	  	#binding.pry
	  	file = params.values[0].tempfile
	  	if file != nil
	  		p "helloooooooooo"
	  		Keyword.destroy_all
	  		Keyword.import(file) 
	  	end
	  	# redirect_to keywords_path
	  end

	  def show
	  end
	end
  end
end