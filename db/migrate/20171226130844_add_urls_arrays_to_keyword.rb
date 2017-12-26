class AddUrlsArraysToKeyword < ActiveRecord::Migration[5.1]
  def change
  	add_column :keywords, :ads_top_urls, :string, array: true, default:[]
  	add_column :keywords, :ads_bottom_urls, :string, array: true, default:[]
  	add_column :keywords, :non_ads_urls, :string, array: true, default:[]
  end
end
