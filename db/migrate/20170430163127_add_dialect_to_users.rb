class AddDialectToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :dialect, :string
  end
end
