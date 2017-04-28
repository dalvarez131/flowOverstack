class CommentsController < ApplicationController
  def new
  @comment = Comment.new
  end

  def create
    if (params.has_key?(:question_id))
      @question = Question.find(params[:question_id])
  	  @comment = @question.comments.new(comment_params)
      if @comment.save
        redirect_to question_path(params[:question_id])
      else
        redirect_to question_path(params[:question_id])
      end
    else
      @answer = Answer.find(params[:answer_id])
      @comment = @answer.comments.new(comment_params)
      if @comment.save
        redirect_to question_path(@answer.question_id)
      else
        redirect_to question_path(@answer.question_id)
      end
    end
  end

  private
  def comment_params
  	   	params.require(:comment).permit(:description).merge(user_id: current_user.id)
  end
end
