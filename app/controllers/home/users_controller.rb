# administration/registrations_controller.rb
class Home::UsersController < Home::AccountController


  layout 'home'
  def edit
    @titre = "Edition profil"
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      flash[:success] = "Profil actualise."
      redirect_to home_root_path
    else
      flash[:fail] = "Impossible de mettre a jour le profil."
      redirect_to home_edit_user_path
    end
  end

end