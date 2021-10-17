class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_new_arrival_posts, only: %i[ show edit ]
  before_action :set_relation_posts,:set_pickup_post, only: %i[ show ]
  before_action :set_recommend_posts, only: %i[ show edit]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_new_arrival_posts
      @new_arrival_posts = Post.new_arrival_posts(@post)
    end

    # @return [ActiveRecord::Relation<Post>] 閲覧中の投稿に関連する投稿
    def set_relation_posts
      @relation_posts = Post.relation_posts(@post)
    end

    # @return [Post] ピックアップしたい投稿
    def set_pickup_post
      @pickup_post = Post.pickup_post
    end

    # @return [ActiveRecord::Relation<Post>] 状況を加味したおすすめ投稿一覧
    def set_recommend_posts
      # おすすめはピックアップを除外した新着ポスト
      @recommend_posts = Post.new_arrival_posts(@pickup_post)
    end

    def post_params
      params.require(:post).permit(:owner_id, :title, :homepage_url, :message)
    end
end
