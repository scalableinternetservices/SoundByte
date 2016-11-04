class SoundByte < ActiveRecord::Base
    has_attached_file :mpeg,
                    url: "/system/:hash.:extension",
                    hash_secret: "abc123"
    validates_attachment :mpeg,
                         content_type: { content_type: ['audio/mpeg', 'audio/mp3'] }
end
