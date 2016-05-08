class PostsController < ApplicationController

	def index
		@posts = Post.all.order('created_at DESC')
    @post = Post.new
	end

  def new
  	@post = Post.new

  end
def create
  # puts params.inspect
  if Post.create(user_id: session[:user_id], body: params[:post][:body], title:params[:post][:title])
    redirect_to posts_path
  else
    redirect_to users_path
  end
end

  def delete
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])
    @post.update(body: params[:post][:body], title: params[:post][:title])
    @post.save
    redirect_to posts_path
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path

  end



end
