class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  private

  def post_params
    params.require(:post).permit(:name,
                                 :photo,
                                 :last_contact_date,
                                 :sex,
                                 :dob,
                                 :complexion,
                                 :description)
  end
end
