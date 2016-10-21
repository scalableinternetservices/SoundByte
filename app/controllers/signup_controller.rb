class SignupController < ApplicationController
    before_action :authenticate_user!, :configure_permitted_paramters
    
    def configure_permitted_paramters
       devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
            format {render "signup"}
        end 
    end
end
