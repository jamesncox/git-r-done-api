class ChangeCategoryToList < ActiveRecord::Migration[6.0]
  def change
    rename_table :categories, :lists
  end
end
