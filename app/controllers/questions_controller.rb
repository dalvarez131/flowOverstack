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
  #   @answer = Answer.find_by(@question.answer_id)
  # <%owner = User.find_by(id: question.user_id)%>

  end

  def create_vote
    @question = Question.find(params[:id])
    @question.vote = @question.vote + 1
    @question.save
    redirect_to
  end

  private
   def question_params
   	params.require(:question).permit(:title, :description).merge(user_id: current_user.id)
   end

end
