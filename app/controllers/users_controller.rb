class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:sort_by] == 'popular'
      @comments = @user.comments.paginate(page: params[:page], per_page: 5).order('rating DESC, created_at ASC')
    else
      @comments = @user.comments.paginate(page: params[:page], per_page: 5 ).order('created_at DESC')
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @users = User.all.order('karma desc')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    able_to_edit_profile?

    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.save        

        # sign the user in with their new password so it doesn't redirect to the login screen
        sign_in @user, :bypass => true

        format.html { 
          flash[:notice] = 'User was successfully updated.'
          redirect_to session.delete(:return_to)
        }
        format.json { head :no_content }
      else
        format.html { render action: "edit", notice: 'Error updating user.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def able_to_edit_profile?
    unless current_user.id != @user.id
      flash[:alert] = "Это не ваш профиль, что вы здесь забыли? >_<"
      redirect_to :root
    end
  end
end