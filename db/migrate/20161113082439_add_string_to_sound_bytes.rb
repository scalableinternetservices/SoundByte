class AddStringToSoundBytes < ActiveRecord::Migration
  def change
    add_column :sound_bytes, :tag, :string
  end
end
