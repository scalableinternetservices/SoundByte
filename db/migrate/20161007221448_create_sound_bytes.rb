class CreateSoundBytes < ActiveRecord::Migration
  def change
    create_table :sound_bytes do |t|
      t.integer :sbid
      t.string :mp3_file
      t.string :acctid

      t.timestamps null: false
    end
  end
end
