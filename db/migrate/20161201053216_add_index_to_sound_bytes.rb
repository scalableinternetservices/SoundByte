class AddIndexToSoundBytes < ActiveRecord::Migration
  def change
    add_index :sound_bytes, [:created_at, :mpeg_file_name]
  end
  
  def change
    add_index :sound_bytes, [:tag, :email]
  end
end
