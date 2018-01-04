class KeywordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @keywords = if is_performing_search?
                  Keyword.search(search_params).paginate(page: params[:page], per_page: 10) 
                else 
                  Keyword.all.order(keyword: :asc).paginate(page: params[:page], per_page: 10)
                end

  	@count = @keywords.count

    respond_to do |format|
      format.html
      format.pdf do
        pdf = KeywordsReportPdf.new(@keywords)
        send_data pdf.render, filename: "Keywords Report.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  def import
  	if params[:file]
      #binding.pry
  		ScrapingJob.perform_later(params[:file].path) 
      flash[:success] = "Uploaded Successfuly!"
      redirect_to keywords_path
  	else
      flash[:alert] = "Can't read CSV file or it's empty"
      render :index
    end
    
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  private 
  def is_performing_search?
    params.has_key?(:search_keyword) || params.has_key?(:search_adwords_urls) || params.has_key?(:search_url)
  end

  def search_params
    params.permit(:search_keyword, :search_adwords_urls, :search_url)
  end

end
