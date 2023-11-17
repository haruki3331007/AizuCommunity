class UsersController < ApplicationController
    before_action :correct_user, except: [:index, :complete, :show]
    before_action :correct_admin, only: [:index]

    def complete

    end

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

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to root_path
        else
            render "show"
        end
    end

    private

    def correct_user
        unless (user_signed_in? && current_user == User.find(params[:id]))  || admin_signed_in?
            redirect_to root_path
        end
    end

    def correct_admin
        unless admin_signed_in?
            redirect_to root_path
        end
    end
end
