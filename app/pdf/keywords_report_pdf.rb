class KeywordsReportPdf < Prawn::Document
  def initialize(keywords)
  	super()
  	@keywords = keywords
  	font Rails.root.join("app/assets/fonts/DejaVuSans.ttf")
  	logo
  	title
  	draw_table
  end

  def logo
  	define_grid(:columns => 5, :rows => 8, :gutter => 10) 
  	grid([0,0], [0,1]).bounding_box do 
	  text "GOOGLE SCRAPER", :size => 18
	  text "Date: #{Date.today.to_s}", :align => :left
	end
  end

  def title
  	text "Keywords Report", size: 20, align: :center
  end

  def draw_table
  	move_down 30
  	arr = [["Keyword", "AdWords/Top Position", "AdWords/Bottom Position", "Total Adwords", "Total Non-AdWords",
  		"Total Links", "Total Search Results"]]
  	@keywords.each do |keyword|
  		arr.push([keyword.keyword, keyword.ads_top_num, keyword.ads_bottom_num, keyword.ads_total_num, keyword.non_ads_num,
  				keyword.total_links_num, keyword.total_search_results_num])
  	end
  	table(arr, row_colors: ["DDDDDD", "FFFFFF"], header: true)
  end

end