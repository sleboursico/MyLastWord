class Home::AccountController < ApplicationController

  before_filter :require_authentication
  layout 'home'


  def index
    # Used as homepage for the administration of the website.
  end


  protected

  def require_authentication
    unless current_user
      render :file   => 'views/forbidden.html.erb',
             :layout => 'error',
             :status => 403
      return
    end
  end

end
 