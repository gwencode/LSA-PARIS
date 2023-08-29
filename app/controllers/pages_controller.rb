class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home cabinet expertise equipe]

  def home
    @posts = Post.order(date: :desc).first(2)
  end

  def cabinet
  end

  def expertise
  end

  def equipe
  end

  # def contact
  # end

  # def message
  #   if formulaire_valid?
  #     # ContactMailer.with(contact: @contact).contact.deliver_now
  #     redirect_to contact_path, notice: "Votre message a bien été envoyé."
  #   else
  #     flash.now[:alert] = "Il y a des erreurs dans le formulaire."
  #     render :contact
  #   end
  # end

  # private

  # def formulaire_valid?
  #   @contact = Contact.new(contact_params)
  #   @contact.valid?
  # end
end
