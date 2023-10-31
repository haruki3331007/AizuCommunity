class ContactsController < ApplicationController
    def index

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

    end

    private

    def contact_params
        params.require(:contact).permit(:name, :email, :genre, :title, :body)
    end

end
