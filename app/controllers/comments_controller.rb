class CommentsController < ApplicationController
  def create

    path = request.path
    entity_type = path.match(/\/(\w*)\//)[1].singularize
    klass = entity_type.capitalize.constantize
    klass_id = "#{entity_type}_id"
    @commentable = klass.find(params[klass_id])
    @comment = @commentable.comments.build(parameters)
    # byebug
    # @comment.user_id = current_user.id
    @comment.save
    send "redirect_to_#{entity_type}", @commentable
  end

  def redirect_to_question(commentable)
      redirect_to question_path(commentable)      
  end

  def redirect_to_answer(commentable)
      redirect_to question_answer_path(commentable.question,commentable)
  end

  def parameters
    params[:comment][:user_id] = current_user.id
    params.require(:comment).permit(:content,:user_id)
    
  end
end
