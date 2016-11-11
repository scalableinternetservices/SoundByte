class AddStringToUsers < ActiveRecord::Migration
  def change
<<<<<<< HEAD
      # add_column :users, :user_id, :string
      add_column :users, :age, :string
=======
      add_column :users, :age, :integer
>>>>>>> fa21596ceea33639a089e74c4416dc980bce8ac3
  end
end
