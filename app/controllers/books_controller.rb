class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params) #1&2データを受け取り新規登録するためis作成
    if @book.save #3データをdbに保存するためのsaveメソッド実行
     redirect_to book_path(@book.id), notice: "Book was successfully created."  #index画面へリダイレクト
    else
    @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books", notice: "Book was successfully destroyed"
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
