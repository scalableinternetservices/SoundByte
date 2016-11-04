class AddStringToUsers < ActiveRecord::Migration
  def change
      add_column :users, :user_id, :string
      add_column :users, :age, :string
  end
end
