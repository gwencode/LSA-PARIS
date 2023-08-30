class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @posts = Post.order(date: :desc).first(2)
  end

  def cabinet
  end

  def expertise
  end

  def equipe
  end

  def liens_utiles
  end

  def confidentialite
  end

  def mentions_legales
  end
end
