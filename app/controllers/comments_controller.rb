class CommentsController < ApplicationController
  def new
  @comment = Comment.new
  end

  def create
  	@question = Question.find(params[:question_id])
  	@comment = @question.comments.new(comment_params)
    if @comment.save
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id])
    end
  end

  private
  def comment_params
  	   	params.require(:comment).permit(:description).merge(user_id: current_user.id)
  end
end
