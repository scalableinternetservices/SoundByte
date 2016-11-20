class AddEmailToSoundBytes < ActiveRecord::Migration
  def change
    add_column :sound_bytes, :email, :string
  end
end
