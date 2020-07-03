class RenameItemsToTodos < ActiveRecord::Migration[6.0]
  def change
    rename_table :items, :todos
  end
end
