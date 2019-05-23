class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      #do something
    else
      render :new
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
