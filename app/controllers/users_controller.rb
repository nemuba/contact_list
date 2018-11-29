class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(params_user)
        if @user.save
          flash[:success] = "Usuário criado com sucesso !"
          redirect_to root_path
        else
          flash[:danger] = "Erro ao criar usuário."
          render :new
        end
    end
    
    private

    def params_user
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
        @user = Contact.find(params[:id])
    end
end
