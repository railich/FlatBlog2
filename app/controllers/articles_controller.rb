class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :article_and_category, :only => [:show, :edit, :update, :destroy, :update_rating]
  before_filter :user_vote, :only => [:index, :update_rating]
  
  
  def index
    @articles = Article.all
    
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @articles }
    end
  end

  def show
    @comments = Comment.get_comments(@article.id)
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @article }
    end
  end

  def new
    @article = Article.new
    @categories = Category.all
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @article }
    end
  end

  
  def edit
    @categories = Category.all
  end

  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
  
  def user_vote
    @user_vote = Vote.user_vote(request.remote_ip())
  end  
  
  def update_rating
    if @user_vote.grep(@article.id).count.zero?
      Vote.add_user(@article.id, request.remote_ip())
      @article.rating += params[:value].to_i
      if @article.save
        respond_to do |format|
          format.html {redirect_to(articles_path, :notive => "Your vote accepted!")}
          format.js {}
        end
      end
    end
  end
  
private
 
  def article_and_category
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)  
  end
  
  
end
