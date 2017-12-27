require 'csv'
require 'open-uri'
require 'user_agent_randomizer'

class Keyword < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |keyword|
      url = url = "http://www.google.com/search?q=#{keyword.to_s}"
      random_agent =  UserAgentRandomizer::UserAgent.fetch.string
      doc = Nokogiri::HTML(open(url, "User-Agent" => random_agent))
      
      html = doc.to_html.force_encoding('iso8859-1').encode('utf-8') #HTML code of the page

      #Number of AdWords in top position
      ads_top_num = doc.css("div[@id='_Ltg']").css('.ads-ad').size
      
      #Number of AdWords in bottom position
      ads_bottom_num = doc.css("div[@id='_Ktg']").css('.ads-ad').size
      
	  #Total number of AdWords
      ads_total_num = ads_top_num + ads_bottom_num
      
      #Number of the non-AdWords results
      non_ads_num = doc.css("div[@id='res']").css('.g').search('cite').size
      
      #Total number of links
      total_links_num = non_ads_num + ads_total_num
      
      #Total of search results for this keywords e.g. About 21,600,000 results (0.42 seconds)
      #total_search_results_num = doc.at_css('#resultStats').inner_html.strip
      total_search_results_num = doc.css('.sd').text

      #URLs of AdWords advertisers in the top position
      ads_top_urls = []
      doc.css("div[@id='_Ltg']").css('.ads-ad').each do |ad|
		ads_top_urls.push(ad.css('.ads-visurl').css('._WGk').text)
	  end

	  #URLs of AdWords advertisers in the bottom position
      ads_bottom_urls = []
      doc.css("div[@id='_Ktg']").css('.ads-ad').each do |ad|
		ads_bottom_urls.push(ad.css('.ads-visurl').css('._WGk').text)
	  end

	  #URLs of the non-AdWords results
      non_ads_urls = []
      doc.css("div[@id='res']").css('.g').search('cite').each do |search|
		non_ads_urls.push(search.inner_text)
	  end

	  Keyword.create!(keyword: keyword, ads_top_num: ads_top_num,
	  				  ads_bottom_num: ads_bottom_num, ads_total_num: ads_total_num,
	  				  non_ads_num: non_ads_num, total_links_num: total_links_num,
	  				  total_search_results_num: total_search_results_num,
	  				  ads_top_urls: ads_top_urls, ads_bottom_urls: ads_bottom_urls,
	  				  non_ads_urls: non_ads_urls)
      #Keyword.create!(keyword: keyword)
    end
  end
end
