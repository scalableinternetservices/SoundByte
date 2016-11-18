class SoundBytesController < ApplicationController
    def index
        @my_sound_bytes = SoundByte.order('created_at')
        @my_sound_bytes_ordered_by_title = SoundByte.order('mpeg_file_name')
        @my_sound_bytes_ordered_by_tag = SoundByte.order('tag')
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
    
    def show_by_date
        render '@my_sound_bytes'
    end
    
    def show_by_title
        render '@my_sound_bytes_ordered_by_title'
    end
    
    def show_by_tag
        render '@my_sound_bytes_ordered_by_tag'
    end
    
    def sound_byte
        if params[:byte_order] == 'date'
            puts "hello"
    @my_sound_bytes = SoundByte.order('created_at')
                render :index
        elsif params[:byte_order] == 'title'
            puts "does this get here"
            render @my_sound_bytes_ordered_by_title
        elsif params[:byte_order] == 'tag'
            render @my_sound_bytes_ordered_by_tag
        else
            render @my_sound_bytes
        end
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