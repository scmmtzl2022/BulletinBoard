class PasswordMailer < ApplicationMailer
  before_action :set_params
  def reset
    @user = params[:user]
    mail(to: @user.email, subject: "WeBakeLove Order Confirmaiton - Order \##{@user.id}")
    
    # @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    # mail to: params[:user].email
  end
  def set_params
    @user = params[:user]
  end
end

