class ContactMailer < ApplicationMailer
  default from: ENV['SENDMAIL_USERNAME']

  def contact_admin_email
    @contact = params[:contact]
    mail(to: ENV['SENDMAIL_USERNAME'], subject: @contact.subject.strip)

    ### RODY : modifie ce qu'il y a dans subject: si veux modifier l'objet du mail
    ### RODY : Commente la ligne 7 et décommente la ligne ci-dessous si tu veux tester de t'envoyer des mails à ton adresse email
    # mail(to: ENV['ADMIN_EMAIL_2'], subject: "#{@contact.subject.strip}")
  end

  def contact_user_email
    @contact = params[:contact]
    # A modifier avec le nom de domaine final
    mail(to: @contact.email, subject: "lsa-paris.fr - Confirmation de votre message")
  end
end
