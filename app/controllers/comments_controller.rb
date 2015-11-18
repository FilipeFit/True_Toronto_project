class CommentsController < ApplicationController  

  def owner?
    comment = Comment.find(params[:id])
    current_user.id == comment.user_id
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comentário criado com sucesso!"
    else
      flash[:error] = "O texto do comentários e obrigatório"
    end  
    redirect_to @post
  end

  def destroy
    if owner?
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to post_path(@comment.post_id), notice: "Comentário excluido com sucesso!"
    end
  end 

  private

  def set_comment
    @comment = Comment.find(params[comment_params.id])
  end

  def comment_params
    params.require(:comment).permit(:body, :id)
  end
end
