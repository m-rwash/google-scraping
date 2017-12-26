class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.text :html
      t.number :ads_top_num
      t.number :ads_bottom_num
      t.number :ads_total_num
      t.number :non_ads_num
      t.number :total_links_num
      t.number :total_search_results_num

      t.timestamps
    end
  end
end
