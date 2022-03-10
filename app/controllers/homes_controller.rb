class HomesController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new (book_params) #1&2データを受け取り新規登録するためis作成
    book.save　#3データをdbに保存するためのsaveメソッド実行
    redirect_to "/top" #top画面へリダイレクト
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
