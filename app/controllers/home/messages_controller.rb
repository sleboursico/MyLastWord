class Home::MessagesController  < ApplicationController


  layout 'home'
  def index
    @title = t('site.home.message.title')
    @messages = current_user.messages

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end


  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @title = t('site.home.message.creer')
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end


  def edit
    @title = t('site.home.message.modifier')
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @message = Message.new(params[:message])
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to home_messages_path, notice: 'Le message a ete ajoute a votre carnet' }
        format.json { render json: @message, status: :created, location:  @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end


  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to home_messages_path, notice: 'Le contact a ete mis a jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to home_messages_path
  end



end
