class ContactController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new message]

  def new
    @contact = Contact.new
  end

  def message
    @contact = Contact.new(contact_params)
    if @contact.valid?
      # ContactMailer.with(contact: @contact).contact.deliver_now
      redirect_to contact_path, notice: "Votre message a bien été envoyé."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :fonction, :firm, :email, :phone, :subject, :message)
  end
end
