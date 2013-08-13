# administration/users_controller.rb
class Home::UsersController < ApplicationController

  layout 'home'
  def edit
    @titre = "Edition profil"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil actualise."
      redirect_to home_root_path
    else
      flash[:fail] = "Impossible de mettre a jour le profil."
      redirect_to edit_home_user_path
    end
  end



end