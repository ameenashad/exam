class QuestionsController < ApplicationController

  def new
  	@question = Question.new
    @categories = Category.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.find(params[:id])
    
  end


  def create
    user = current_user
    user_id = user.id
  	@question = Question.new(parameters)
    @question.user_id = user_id
    @question.save
  	redirect_to questions_path  	
  end

  def index
  	@questions = Question.all
  end

  def parameters
  	params.require(:question).permit(:title, :description, :category_id)
  end
end
