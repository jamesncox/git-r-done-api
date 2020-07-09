class ChangeTodosCategoryIdToListId < ActiveRecord::Migration[6.0]
  def change
    rename_column :todos, :category_id, :list_id
  end
end
