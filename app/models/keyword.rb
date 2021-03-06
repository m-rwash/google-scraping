class Keyword < ApplicationRecord
  validates :keyword, presence: true

  def self.search(search_params)
    return search_keyword(search_params[:search_keyword]) if search_params[:search_keyword].present?
    return search_adwords_urls(search_params[:search_keyword]) if search_params[:search_adwords_urls].present?
    search_url(search_params[:search_url]) if search_params[:search_url].present?
  end

  private

  def self.search_keyword(term)
    binding.pry
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
