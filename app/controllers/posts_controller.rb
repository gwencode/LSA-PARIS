class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = filter_posts(Post.all)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      default_photo(@post) if @post.photo.key.nil?
      redirect_to posts_path, notice: "Actualitée postée 👍"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params.except(:photo))
      if post_params[:photo].present?
        @post.photo.purge
        @post.photo.attach(post_params[:photo])
      end
      redirect_to post_path(@post), notice: "Actualitée modifiée 👍"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Actualitée supprimée 👍"
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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category, :date, :title, :subtitle, :publish_link, :content, :article_link, :photo)
  end

  def default_photo(post)
    post.photo.purge
    default_photo = File.open(File.join(Rails.root,'app/assets/images/actu.jpg'))
    post.photo.attach(io: default_photo, filename: "lsa-actu", content_type: "image/png")
  end
end
