class ValidationController < ActionController::Base

  layout 'application'


  def verify
    @validation = Validation.find_by_token(params[:token])

    if is_valid (@validation)
      @validation.user.dateDerniereValidation = Date.current
      @validation.statut = Validation.statuts.valide
      @validation.save
      @date = l(@validation.user.date_prochain_rappel)

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @validation }
      end
    else
      render :file   => 'validation/error.html.erb',
             :layout => 'application'
    end
  end

  def is_valid (validation)
    return validation.en_attente? && DateTime.current < validation.date + 48.hours

  end




end
