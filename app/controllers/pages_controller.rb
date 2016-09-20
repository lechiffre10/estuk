class PagesController < ApplicationController
  # make sure users are logged in.
  before_action :authenticate_user!, only: [:dashboard]

  def home
    if current_user
      redirect_to books_path
    end
    @books = Book.last(4)
  end

  def dashboard
    @books = current_user.books
  end
end
