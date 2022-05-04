class PostsController < ApplicationController 
    def index
      @posts = Post.all
    end 

    def new
      @post = Post.new
    end
    def show
      @post = Post.find(params[:id])
    end

    def search 
      @posts = Post.where("posts.description LIKE ?",["%#{params[:query]}%"])
      render "index"
    end

    def confirm_create
      @post = Post.new(post_params)
      unless @post.valid?
          render :new
      end
    end
  
    def create
      @post = Post.new(post_params)
      @post.status = 1
      @post.create_user_id = current_user.id
      @post.updated_user_id = current_user.id
  
      if @post.save
        redirect_to posts_path, notice: "Post Created!"
      else
        render :new
      end
    end
    def edit
      @post = Post.find(params[:id])
    end
  
    def confirm_update
      @post = Post.new(post_update_params)
      unless @post.valid?
          render :edit
      end
    end
  
    def update
      @post = Post.find(params[:id])
      @post.updated_user_id = current_user.id
  
      if @post.update(post_update_params)
        redirect_to @post, notice: "Post Updated!"
      else
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy 
      redirect_to posts_path, notice: "Post deleted!"
    end

    private
    def post_params
      params.require(:post).permit(:title, :description)
    end

    def post_update_params
      params.require(:post).permit(:title, :description, :status)
    end
end
  
  
  
  