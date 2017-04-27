class UsersController < ApplicationController
  def delete
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url

  end
end
