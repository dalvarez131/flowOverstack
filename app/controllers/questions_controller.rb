class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def new
    if current_user
  	   @question = current_user.questions.build
     else
       flash[:notice] = "Registrate para hacer preguntas!"
     end
  end

  def create
    if current_user
  	   @question = current_user.questions.build(question_params)
 	     if @question.save
 		      redirect_to @question
 	     else
 		       render :new
       end
     else
         flash[:notice] = "Registrate para hacer preguntas!"
     end
  end

  def show
  	@question = Question.find(params[:id])
  end

  private
   def question_params
   	params.require(:question).permit(:title, :description)
   end
end
