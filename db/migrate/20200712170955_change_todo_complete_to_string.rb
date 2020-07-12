class ChangeTodoCompleteToString < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :complete, :string
  end
end
