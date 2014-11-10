# coding: utf-8

class Admin::BooksController < Admin::Base
  # 蔵書一覧
  def index
    @books = Book.order("number")
  end

  # 検索
  def search
    @books = Book.search(params[:q])
    render "index"
  end

  # 蔵書情報の詳細
  def show
    @book = Book.find(params[:id])
  end

  # 新規作成フォーム
  def new
    @book = Book.new()
  end

  # 更新フォーム
  def edit
    @book = Book.find(params[:id])
  end

  # 蔵書の新規登録
  def create
    @book = Book.new(params[:book],as: :admin)
    if @book.save
      redirect_to [:admin, @book], notice: "蔵書を登録しました。"
    else
      render "new"
    end
  end

  # 蔵書情報の更新
  def update
    @book = Book.find(params[:id])
    @book.assign_attributes(params[:book])
    if @book.save
      redirect_to [:admin, @book], notice: "蔵書情報を更新しました。"
    else
      render "edit"
    end
  end

  # 蔵書の削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :admin_books, notice: "蔵書を削除しました。"
  end
end
