class AddStringToUsers < ActiveRecord::Migration
  def change
<<<<<<< HEAD
      # add_column :users, :user_id, :string
      add_column :users, :age, :string
=======
      add_column :users, :age, :integer
>>>>>>> c30b3d053b3eab1aeb10d1ebd3914438b7771408
  end
end
