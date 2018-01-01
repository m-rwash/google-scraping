Fabricator(:keyword) do
  keyword                  FFaker::Product.product_name
  html                     FFaker::HTMLIpsum
  ads_top_num              [0..5].sample
  ads_bottom_num           [0..5].sample
  ads_total_num            [0..5].sample
  non_ads_num              [5..15].sample
  total_links_num          [5..15].sample
  total_search_results_num "About 513,000 results (0.46 seconds)"
  ads_top_urls             FFaker::Internet.http_url+" , "*5
  ads_bottom_urls          FFaker::Internet.http_url+" , "*5
  non_ads_urls             FFaker::Internet.http_url+" , "*10
end
