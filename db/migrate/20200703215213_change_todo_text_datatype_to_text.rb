class ChangeTodoTextDatatypeToText < ActiveRecord::Migration[6.0]
  def change
    change_column :todos, :text, :text
  end
end
