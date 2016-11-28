module SoundBytesHelper
    def cache_key_for_soundbytes_page
        "soundbytes-page-#{SoundByte.maximum(:updated_at)}"
    end
    
    def cache_key_for_my_soundbytes
        "my-soundbytes-#{@my_sort_by}"
    end
    
    def cache_key_for_all_soundbytes
        "all-soundbytes-#{@public_sort_by}"
    end
end