
class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user! , only: [:new, :create]
  # GET /users/new
  def new
    @user = User.new
  end

  def show
    @user = @current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'User was successfully created.'
    else
      render :new
    end
  end
  # DELETE /users/1
  def destroy
    user_to_delete = User.find(current_user.id)
    user_to_delete.destroy
    redirect_to login_path, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end



