class Home::ContactsController < ApplicationController
  # GET /tweets
  # GET /tweets.json
  layout 'home'

  def index
    @title = t('site.home.contact.title')
    @contacts = current_user.contacts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @title = t('site.home.contact.ajouter')
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @contact = Contact.new(params[:contact])
    @contact.user = current_user
    respond_to do |format|
      if @contact.save
        format.html { redirect_to home_contacts_path, notice: 'Le contact a ete ajoute a votre carnet' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end


  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to home_contacts_path, notice: 'Le contact a ete mis a jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to home_contacts_path
  end


  def edit
    @title = t('site.home.contact.modifier')
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end


  private
  def authenticate
    deny_access unless signed_in?
  end


end
