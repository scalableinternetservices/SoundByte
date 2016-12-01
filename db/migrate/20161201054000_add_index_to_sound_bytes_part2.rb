class AddIndexToSoundBytesPart2 < ActiveRecord::Migration
  def change
    add_index :sound_bytes, [:created_at, :mpeg_file_name]
  end
end
