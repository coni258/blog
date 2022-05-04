class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.all
  end
#mostrar
  def show
    @article = Article.find(params[:id])
  end
#Nuevo
  def new 
    @article = Article.new
  end
#Crear
  def create  
    @article = Article.new(article_params)
    @article.status = 'public'
    if @article.save
    redirect_to article_path(@article) #si cumple con las validaciones guarde y rediccione a articulo
    else 
    render :new, status:  :unprocessable_entity #Si no cumple envia mensajes de error
    end
  end
#edit
  def edit  
    @article = Article.find(params[:id]) #busca el articulo a editar
  end
#Actualizacion
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params) #Si cumple las validaciones los nuevos parametros lo actualiza
    redirect_to @article
    else
    render :edit, status: :unprocessable_entity #si no, tira mensajes de error
    end
  end

  def destroy
    @article = Article.find(params[:id]) #Busca los parametros seleccionados
    @article.destroy #destruye
    redirect_to root_path, status: :see_other #redirige a la pag principal
  end

  private
    
  def article_params
    params.require(:article).permit(:title, :body, :status) #Define los parametros que tendra un articulo 
  end
end
