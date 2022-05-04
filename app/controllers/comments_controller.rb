class CommentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "admin", only: :destroy

  def create #Crear comentario
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy #Destruir comentario
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: 303
  end

  private
    def comment_params #parametros para el comentario
    params.require(:comment).permit(:commenter, :body, :status)
    end
end
