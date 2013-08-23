class Home::ParametresController < Home::AccountController

  layout 'home'
  include ParametresHelper

  def edit
    @title = t('site.home.parametres.titre')
    @date = date_prochain_rappel (current_user.dateDerniereValidation)
    @user = current_user;
  end

  def update

    respond_to do |format|
      if current_user.update_attributes(params[:user])
        @user = current_user
        @date = date_prochain_rappel (current_user.dateDerniereValidation)
        format.html { render :partial => "form", :object => @user, notice: 'Le contact a ete mis a jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


end