class QuestionsController < ApplicationController

  def new
  	@question = Question.new
  end

  def create
    user = current_user
    user_id = user.id
  	@question = Question.create(parameters)
    @question.update(user_id: user_id)
    
  	redirect_to questions_path  	
  end

  def index
  	@questions = Question.all
  end

  def parameters
  	params.require(:question).permit(:title, :description, :category)
  end
end
