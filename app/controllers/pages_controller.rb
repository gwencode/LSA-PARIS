class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home cabinet expertise equipe contact]

  def home
    @posts = Post.order(date: :desc).first(2)
  end

  def cabinet
  end

  def expertise
  end

  def equipe
  end

  def contact
  end
end
