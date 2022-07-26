class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @post_favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @post_favorite.destroy
    #redirect_back(fallback_location: root_path)
  end
end
