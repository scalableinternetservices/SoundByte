class SoundBytesController < ApplicationController
    def index
        @my_sound_bytes = SoundByte.order('created_at')
        # TODO: Find a way to get follower sound bytes
        @follower_sound_bytes = SoundByte.order('id').reverse_order # Prove that this is different
    end
    
    def new
        @sound_byte = SoundByte.new
    end

    def create
        @sound_byte = SoundByte.new(sound_byte_params)
        if @sound_byte.save
            flash[:success] = "The soundbyte was added!"
            # redirect_to root_path
            redirect_to sound_bytes_path
        else
            render 'new'
        end
    end
    
    def destroy
      @sound_byte = SoundByte.find(params[:id])
      @sound_byte.destroy
      flash[:success] = "The soundbyte was destroyed."
      redirect_to sound_bytes_path
    end
    
    # TODO
    def update
       @sound_byte = SoundByte.find(params[:id])
       @sound_byte.update!(sound_byte_params)
       flash[:success] = "The soundbyte title was changed."
       redirect_to sound_byte_path
    end
    # /TODO

    private
    
    def sound_byte_params
        params.require(:sound_byte).permit(:mpeg, :tag)
    end
end