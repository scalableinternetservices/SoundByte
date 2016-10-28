class SoundByte < ActiveRecord::Base
    has_attached_file :mpeg
    validates_attachment :mpeg,
                         content_type: { content_type: ['audio/mpeg'] }
end
