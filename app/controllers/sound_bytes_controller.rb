class SoundBytesController < ApplicationController
    def index
        @my_sound_bytes = SoundByte.where(user_id: current_user.id).order('created_at')
        @my_sound_bytes_ordered_by_title = SoundByte.where(user_id: current_user.id).order('mpeg_file_name')
        @my_sound_bytes_ordered_by_tag = SoundByte.where(user_id: current_user.id).order('tag')
        if params[:byte_order] == 'date'
            @sort_by = 'date'
         elsif params[:byte_order] == 'title'
            @sort_by = 'title'
        elsif params[:byte_order] == 'tag'
            @sort_by = 'tag'
        else
            @sort_by = 'date'
        end
    end
    
    def new
        @sound_byte = SoundByte.new
    end

    def create
        @sound_byte = SoundByte.new(sound_byte_params)
        @sound_byte.user_id = current_user.id
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