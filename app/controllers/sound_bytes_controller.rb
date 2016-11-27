class SoundBytesController < ApplicationController
    def index
        @my_sound_bytes = SoundByte.where(user_id: current_user.id).order('created_at')
        @my_sound_bytes_ordered_by_title = SoundByte.where(user_id: current_user.id).order('mpeg_file_name')
        @my_sound_bytes_ordered_by_tag = SoundByte.where(user_id: current_user.id).order('tag')
        
        @public_sound_bytes = SoundByte.order('created_at')
        @public_sound_bytes_ordered_by_title = SoundByte.order('mpeg_file_name')
        @public_sound_bytes_ordered_by_tag = SoundByte.order('tag')
        @public_sound_bytes_ordered_by_uploader = SoundByte.order('email')
        
        if params[:my_order] == 'date'
            @my_sort_by = 'date'
         elsif params[:my_order] == 'title'
            @my_sort_by = 'title'
        elsif params[:my_order] == 'tag'
            @my_sort_by = 'tag'
        else
            @my_sort_by = 'date'
        end
        
        if params[:public_order] == 'date'
            @public_sort_by = 'date'
         elsif params[:public_order] == 'title'
            @public_sort_by = 'title'
        elsif params[:public_order] == 'tag'
            @public_sort_by = 'tag'
        elsif params[:public_order] == 'uploader'
            @public_sort_by = 'uploader'
        else
            @public_sort_by = 'date'
        end
    end
    
    def new
        @sound_byte = SoundByte.new
    end

    def create
        @sound_byte = SoundByte.new(sound_byte_params)
        @sound_byte.user_id = current_user.id
        @sound_byte.email = current_user.email
        
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