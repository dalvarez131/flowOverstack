class AnswersController < ApplicationController

    def new
      @answer = Answer.new
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
