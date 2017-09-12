class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post Created!"
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
