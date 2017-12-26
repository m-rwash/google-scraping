class CreateKeywords < ActiveRecord::Migration[5.1]
  def change
    create_table :keywords do |t|
      t.string :keyword
      t.text :html
      t.integer :ads_top_num
      t.integer :ads_bottom_num
      t.integer :ads_total_num
      t.integer :non_ads_num
      t.integer :total_links_num
      t.integer :total_search_results_num

      t.timestamps
    end
  end
end
