class BookCommentsController < ApplicationController

def create
    @post = Book.find(params[:book_id])
    @comment = BookComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @post.id
    @user = @post.user
    @book = Book.new



    if @comment.save
       flash[:notice] = "コメント成功"
      redirect_to book_path(@post)
    else
       flash[:notice] = "コメント失敗"
      render'books/show'
    end
end

def destroy

  @comment = BookComment.find_by(book_id: params[:book_id], id: params[:id])
  @comment.destroy
  redirect_to book_path(params[:book_id])
end

private
def comment_params
  params.require(:book_comment).permit(:comment)
end


end
