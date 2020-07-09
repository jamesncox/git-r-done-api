class ChangeListNameToListCategory < ActiveRecord::Migration[6.0]
  def change
    rename_column :lists, :name, :category
  end
end
