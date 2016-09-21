class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(parameters)
    @answer.user_id = current_user.id
    @answer.save
    redirect_to question_path(@question)
  end

  def parameters
    params.require(:answer).permit(:description)
    
  end
end
