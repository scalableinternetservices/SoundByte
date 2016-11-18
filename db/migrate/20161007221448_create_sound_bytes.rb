class CreateSoundBytes < ActiveRecord::Migration
  def change
    create_table :sound_bytes do |t|
      t.integer :sb_id
      t.string :mp3_file
      t.string :user_id
      t.string :title

      t.timestamps null: false
    end
  end
end
