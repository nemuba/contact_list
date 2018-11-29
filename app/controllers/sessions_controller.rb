class SessionsController < ApplicationController
    def new 
        @user = User.new        
    end

    def create
        
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            sign_in(user)
            flash[:alert] = "Logado com sucesso !"
            redirect_to root_path
        else
            flash[:danger] = "Não foi possivel logar no sistema !"
            render :new
        end
    end

    def destroy
        sign_out
        flash[:success] = "Logout com sucesso !"
        redirect_to entrar_path
    end

    private

    def sessions_params
        params.require(:user).permit(:email,:password)
    end
    
end
