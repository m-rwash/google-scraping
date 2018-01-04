class KeywordsController < ApplicationController
  before_action :authenticate_user!

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
      binding.pry
  		ScrapeWorker.perform_async(params[:file].path) 
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

end
