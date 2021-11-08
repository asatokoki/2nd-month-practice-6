class BooksController < ApplicationController


def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
        flash[:book_create_notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
    else
        render 'books/index'
    end
end

def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    # @post = Book.find(params[:id])
end

def show
    @post = Book.find(params[:id])
    @user = @post.user
    @book = Book.new
    @comment = BookComment.new
end



def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
        redirect_to books_path
    end
end

def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:book_update_notice] = "You have updated book successfully."

        redirect_to book_path(@book.id)
    else
        render 'books/edit'
    end

end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
end

private

  def book_params
  params.require(:book).permit(:title, :body)
  end


end
