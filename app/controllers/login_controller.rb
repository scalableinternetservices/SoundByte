class LoginController < ApplicationController
    before_action :authenticate_user!
end
