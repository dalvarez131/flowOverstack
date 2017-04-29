class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def new
  	   @question = current_user.questions.build
  end

  def create
    @question = Question.new(question_params)
 	   if @question.save
 		    redirect_to @question
 	   else
 		     render :new
     end
  end

  def show
  	@question = Question.find(params[:id])
  end

  def create_vote
      @question = Question.find(params[:id])
      @vote = @question.votes.new(user_id: current_user.id)
      if @vote.save
        redirect_to question_path(params[:id])
      else
        redirect_to question_path(params[:id])
      end
  end

  def delete_vote
    @question = Question.find(params[:id])
    @vote = @question.votes.find(user_id: current_user.id)
    @vote.destroy
    redirect_to question_path(params[:id])
  end


  private
   def question_params
   	params.require(:question).permit(:title, :description).merge(user_id: current_user.id)
   end

end
