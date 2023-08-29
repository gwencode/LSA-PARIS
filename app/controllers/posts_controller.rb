class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @posts = filter_posts(Post.all)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      if @post.photo.key.nil?
        @post.photo.purge
        default_photo = File.open(File.join(Rails.root,'app/assets/images/actu.jpg'))
        @post.photo.attach(io: default_photo, filename: "lsa-actu", content_type: "image/png")
        @post.save
      end
      redirect_to posts_path, notice: "Actualitée postée 👍"
    else
      render :new, status: :unprocessable_entity
    end
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

  def post_params
    params.require(:post).permit(:category, :date, :title, :subtitle, :publish_link, :content, :article_link, :photo)
  end
end
