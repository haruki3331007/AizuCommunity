class ContactsController < ApplicationController
    before_action :correct_admin, only: [:index, :destroy]
    def index
        @contacts = Contact.page(params[:page]).per(10)
    end

    def complete
        
    end

    def new
        @contact = Contact.new
    end

    def create
        contact = Contact.new(contact_params)
        if contact.save
            ContactMailer.with(contact: contact).contact.deliver_now
            redirect_to contacts_complete_path
        else
            @contact = contact
            render "new"
        end
    end

    def edit
        @contact = Contact.find(params[:id])
    end

    def update
        contact = Contact.find(params[:id])
        if contact.update(contact_params)
            ContactMailer.with(contact: contact).reply.deliver_now
            redirect_to contacts_path
        else
            @contact = contact
            render [:edit]
        end
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
        params.require(:contact).permit(:name, :email, :genre, :title, :body, :reply, :reply_body)
    end

end
