class AddAttachmentMpegToSoundBytes < ActiveRecord::Migration
  def self.up
    change_table :sound_bytes do |t|
      t.attachment :mpeg
    end
  end

  def self.down
    remove_attachment :sound_bytes, :mpeg
  end
end
