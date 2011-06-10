class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_filter :article_and_category, :only => [:show, :edit, :update, :destroy, :update_rating]
  before_filter :user_vote, :only => [:index, :update_rating]
  before_filter :categories, :only => [:show, :new, :edit]
  before_filter :set_rating, :only => [:index]

  def index
    if params[:order]
      @articles = Article.below_a_certain_rating(@rating)
      @sort_text = "sort by date, rating more than " + @rating.to_s
    else
      @articles = Article.above_a_certain_rating(@rating)
      @sort_text = "sort by date, rating less than " + @rating.to_s

    end
    respond_to do |format|
      format.html
      format.xml  { render :xml => @articles }
    end
  end

  def show
    @comments = @article.comments
    respond_to do |format|
      format.html
      format.xml  { render :xml => @article }
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @article }
    end
  end


  def edit
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



  def update_rating
    @remote_ip = request.remote_ip
    if @user_vote.grep(@article.id).count.zero?
      @article.votes.create!(:user_ip => @remote_ip, :user_identity => (@article.id.to_s + '#' + @remote_ip.to_s))
      @article.rating += params[:value].to_i
      if @article.save
        respond_to do |format|
          format.html {redirect_to(articles_path, :notive => "Your vote accepted!")}
          format.js {}
        end
      end
    end
  end


  def user_vote
    @user_vote = Vote.user_vote(request.remote_ip())
  end

  def article_and_category
    @article = Article.find(params[:id])
    @category = Category.find(@article.category_id)
  end

  def categories
     @categories = Category.all
  end

  def set_rating
    @rating = 3
  end

end

