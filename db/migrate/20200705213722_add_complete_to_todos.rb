class AddCompleteToTodos < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :complete, :boolean
  end
end
