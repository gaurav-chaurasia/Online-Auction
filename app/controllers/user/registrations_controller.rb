class User::RegistrationsController < Devise::RegistrationsController
   
    private
  
    def sign_up_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :contact_number,
                                   :address,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :contact_number,
                                   :address,
                                   :email,
                                   :password,
                                   :password_confirmation,
                                   :current_password)
    end
end