class ContactsController < ApplicationController
    before_action :correct_admin, only: [:index]
    def index
        @contacts = Contact.all
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def new
        @contact = Contact.new
    end

    def create
        contact = Contact.new(contact_params)
        if contact.save
            ContactMailer.with(contact: contact).contact.deliver_now
            redirect_to root_path
        else
            @contact = contact
            render "new"
        end
    end

    def edit

    end

    def update

    end

    def destroy
        contact = Contact.find(params[:id])
        contact.destroy
        redirect_to contacts_path
    end

    private
    def correct_admin
        unless admin_signed_in?
            redirect_to root_path
        end
    end

    def contact_params
        params.require(:contact).permit(:name, :email, :genre, :title, :body)
    end

end
