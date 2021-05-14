class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        # format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @article = Article.new(article_params)
    # render plain: params
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: "Article was successfully created." }
        # format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
    # if @artcile.save
    #   format.html { redirect_to: :index }
    # else
    #   format.html {render: :new, status: :unprocessable_entity}
    # end
  end

  def destroy
    if @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
        # format.json { head :no_content }
      end
    else
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
