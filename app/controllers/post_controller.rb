class PostsController < ApplicationController

  def create
    # user.post.create(post_params)
    if post = @user.post.create(post_params)
    render json: post.as_json
    else
      render json: { message: "Issue creating post", errors: post.errors.full_messages }
    end

    def post_params
      params.require(:post).permit(:caption, :image_url, :body)
    end
  end
end
