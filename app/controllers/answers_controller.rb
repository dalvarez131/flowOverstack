class AnswersController < ApplicationController

    def new
      @answer = Answer.new
    end
  
  def create_vote
     @answer = Answer.find(params[:id])
     @vote = @answer.votes.new(user_id: current_user.id)
     if @vote.save
       redirect_to question_path(params[:id])
     else
       redirect_to question_path(params[:id])
     end
 end

 def delete_vote
   @answer = Answer.find(params[:id])
   @vote = @answer.votes.find_by(user_id: current_user.id)
   @vote.destroy
   redirect_to question_path(params[:id])
 end

  def create
  	@answer = Answer.new(answer_params)
 	  if @answer.save
 		   redirect_to question_path(params[:question_id])
 	   else
       @question = Question.find(params[:question_id])
       render "/questions/show"
    end
  end
   private
   def answer_params
   	params.require(:answer).permit(:description).merge(question_id: params[:question_id], user_id: current_user.id)
   end

end
