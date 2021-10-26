class PostsController < ApplicationController
  before_action :require_login, only: %i[ new, edit]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @new_arrival_posts = Post.new_arrival_posts(@post)
    @relation_posts = Post.relation_posts(@post)
    pickup_post = Post.pickup_post(current_post: @post, new_arrival_posts: @new_arrival_posts)
    @recommend_posts = Post.new_arrival_posts(pickup_post)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    @new_arrival_posts = Post.new_arrival_posts(@post)
    @relation_posts = Post.relation_posts(@post)
    @recommend_posts = Post.new_arrival_posts(nil)
  end

  ### 中略 ###

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def post_params
      params.require(:post).permit(:owner_id, :title, :homepage_url, :message)
    end
end
