class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = filter_posts(Post.all)
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def filter_posts(posts)
    case params[:catégorie]
    when "classements"
      posts.where(category: "classements").order(date: :desc)
    when "communiqués"
      posts.where(category: "communiqués de presse").order(date: :desc)
    when "événements"
      posts.where(category: "événements").order(date: :desc)
    when "publications"
      posts.where(category: "publications").order(date: :desc)
    else
      posts.order(date: :desc)
    end
  end
end
