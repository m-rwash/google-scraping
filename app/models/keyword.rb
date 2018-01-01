require 'csv'

class Keyword < ApplicationRecord
  validates :keyword, presence: true

  def self.import(file)
    if file.read
      CSV.foreach(file.path) do |keyword, index|
        ScrapeWorker.perform_async(keyword)
      end
    end
  end

  def self.search_keyword(term)
    if term
      self.where('keyword LIKE ?', "%#{term}%")
    else
      self.all
    end
  end

  def self.search_adwords_urls(term)
    if term
      # Concatenate all urls and use || as seprator
      # ILIKE for matching patterns 
      self.where("array_to_string(ads_top_urls, '||') ILIKE :pattern OR 
        array_to_string(ads_bottom_urls, '||') ILIKE  :pattern ", pattern: "%#{term}%")
    else
      self.all
    end
  end

  def self.search_url(term)
    if term
      self.where("array_to_string(ads_top_urls, '||') ILIKE :pattern OR 
        array_to_string(ads_bottom_urls, '||') ILIKE  :pattern OR
        array_to_string(non_ads_urls, '||') ILIKE  :pattern ", pattern: "%#{term}%")
    else
      self.all
    end
  end
end
