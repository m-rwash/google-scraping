class ChangeTotalSearchResultColumnToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :keywords, :total_search_results_num, :string
  end
end
