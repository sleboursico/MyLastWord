class PublicController < ApplicationController
  before_filter :show_maintenance, :if => :website_is_in_maintenance?
  layout 'application'


  def index
    # Used as homepage for the public side of the website.
  end


  protected

  # To set the maintenance mode, just create a file called maintenance.txt in tmp/.
  def website_is_in_maintenance?
    File.exists?(Rails.root.join('tmp', 'maintenance'))
  end

  def show_maintenance
    render :file   => 'views/maintenance.html.erb',
           :layout => 'maintenance'
    return
  end

end
