class UsersController < ApplicationController
  before_action :require_logged_in_user, only: %i[edit update]
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:success] = 'Usuário criado com sucesso !'
      redirect_to entrar_path
    else
      flash[:danger] = 'Erro ao criar usuário.'
      render :new
    end
  end

  def update
    if @user.update(params_user)
      flash[:notice] = 'Usuário atualizado com sucesso !'
      redirect_to contacts_path
    else
      flash[:danger] = 'Erro ao atualizar usuário !'
      render :edit
    end
  end

  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
