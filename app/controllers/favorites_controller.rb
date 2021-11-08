class FavoritesController < ApplicationController
# ↓カリキュラムのこいつ参照
# def create
    # post_image = PostImage.find(params[:post_image_id])
    # favorite = current_user.favorites.new(post_image_id: post_image.id)
    # favorite.save
    # redirect_to post_image_path(post_image)
# end



def create
    post = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(bookid: book.id)
    favorite = current_user.favorites.new(book_id: post.id)

    favorite.save
    redirect_to request.referer
end

def destroy

    post = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: post.id)
    favorite.destroy
    redirect_to request.referer
end


end
