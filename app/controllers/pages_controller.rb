class PagesController < ApplicationController
  def home
    # redirect_to articles_path if logged_in?
    @user = current_user
  end
  
  def about 
  end
end