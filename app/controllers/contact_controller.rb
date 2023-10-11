class ContactController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new message]

  def new
    @contact = Contact.new
    authorize @contact
  end

  def message
    @contact = Contact.new(contact_params)
    authorize @contact
    # Captcha
    @contact.validate # this line will validate the user even if Recaptcha failed. This way we will present all potential validation errors right away
    v3_verify = verify_recaptcha action: 'message', minimum_score: 0.9, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3']
    v2_verify = verify_recaptcha(secret_key: ENV['RECAPTCHA_SECRET_KEY_V2'])

    if (v3_verify || v2_verify) && @contact.valid?
      ContactMailer.with(contact: @contact).contact_admin_email.deliver_now
      ContactMailer.with(contact: @contact).contact_user_email.deliver_now
      redirect_to root_path, notice: "Votre message a bien été envoyé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :fonction, :firm, :email, :phone, :subject, :message)
  end
end
