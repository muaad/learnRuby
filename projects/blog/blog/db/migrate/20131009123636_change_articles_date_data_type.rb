class ChangeArticlesDateDataType < ActiveRecord::Migration
  def change
    change_column :articles, :date, :datetime
  end
end
