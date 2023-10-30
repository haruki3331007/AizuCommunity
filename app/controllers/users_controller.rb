class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        if params[:id]
            @user = User.find(params[:id])
        else
            @user = current_user
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            render "edit"
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to root_path
        else
            render "show"
        end
    end

    private

    def user_params
        params.require(:user).permit(   :name, 
                                        :user_name,
                                        :email,
                                        :location,
                                        :password
                                    )
    end
end
