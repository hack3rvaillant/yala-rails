class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render :edit, notice: "Your informations have been saved!"
    else
      render :edit, alert: "Something went wrong"
    end
    # TODO, if :email_changed? -> send a confirmation email devise confirmable
    # TODO, if :password_changed? -> check if devise needs a specific flow for that case
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email)
  end
end
