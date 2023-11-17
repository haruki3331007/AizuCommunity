class ContactMailer < ApplicationMailer
    def contact
        @contact = params[:contact]
        mail(to: @contact.email, subject: 'お問い合わせ内容について')
    end

    def reply
        @contact = params[:contact]
        mail(to: @contact.email, subject: 'Re; お問い合わせ内容について')
    end
end
