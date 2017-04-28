class VotesController < ApplicationController
  def index
  end
  def new
  	@vote = Vote.new
  end

  def create

    if (params.has_key?(:question_id))
      @question = Question.find(params[:question_id])
  	  @vote = @question.votes.new(user_id: current_user.id)
      if @vote.save
        redirect_to question_path(params[:question_id])
      else
        redirect_to question_path(params[:question_id])
      end
    else
      @answer = Answer.find(params[:answer_id])
      @vote = @answer.votes.new(user_id: current_user.id)
      if @vote.save
        redirect_to question_path(@answer.question_id)
      else
        redirect_to question_path(@answer.question_id)
      end
    end
  end

end
