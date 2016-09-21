class CommentsController < ApplicationController
  def create

    path = request.path
    klass = path.match(/\/(\w*)\//)[1].singularize.capitalize.constantize
    klass_id = path.match(/\/(\w*)\//)[1].singularize + "_id"

    @commentable = klass.find(params[klass_id])
    @comment = @commentable.comments.build(parameters)
    @comment.user_id = current_user.id
    @comment.save
    if klass_id == "answer_id"
      redirect_to question_answer_path(@commentable.question,@commentable)
    else
      redirect_to question_path(@commentable)
    end
  end
  def parameters
    params.require(:comment).permit(:content)
    
  end
end
