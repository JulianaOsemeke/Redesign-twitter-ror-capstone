class RegistrationsController < Devise::RegistrationsController
  private
  
  def sign_up_params
  params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation, :photo, :cover_image)
  end
  
  def account_update_params
  params.require(:user).permit(:username, :fullname, :email, :password, :password_confirmation, :current_password,:photo, :cover_image)
  end
  end 