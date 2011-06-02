class CommentController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html {redirect_to(@article, :notice => 'Add comment')}
        format.xml {render :xml => @article, :status => :created, :location => @article}
      else
        format.html {redirect_to(@article, :notice => 'Comment was not saved, fill in all fields!')}
        format.xml {render :xml => @comment.errors, :status => :unprocessable_entity}
      end
    end
  end

end
