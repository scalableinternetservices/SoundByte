class SoundBytesController < ApplicationController
    def index
        @sound_bytes = SoundByte.order('created_at')
    end
    
    def new
        @sound_byte = SoundByte.new
    end

    def create
        @sound_byte = SoundByte.new(sound_byte_params)
        if @sound_byte.save
            flash[:success] = "The photo was added!"
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def destroy
      @sound_byte = SoundByte.find(params[:id])
      @sound_byte.destroy
      flash[:success] = "The soundbyte was destroyed."
      redirect_to root_path
    end

    private
    
    def sound_byte_params
        params.require(:sound_byte).permit(:mpeg)
    end
end