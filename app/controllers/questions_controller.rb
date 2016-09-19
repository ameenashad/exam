class QuestionsController < ApplicationController

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.create(parameters)
  	#byebug
  	
  	redirect_to questions_path  	
  end

  def index
  	@questions = Question.all
  end

  def parameters
  	params.require(:question).permit(:title, :description, :category)
  end
end
