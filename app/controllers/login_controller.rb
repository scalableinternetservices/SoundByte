class LoginController < ApplicationController
    before_action :authenticate_user!
    
    def configure_permitted_paramters
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
            user_params.permit(:username, :email) 
        end
    end
end
