# coding: utf-8

class Admin::BookshelvesController < Admin::Base
  def index
    begin
       @member = Member.find(session[:member_id]);
    rescue ActiveRecord::RecordNotFound
       logger.error("Attempt to access invalid user #{session[:user_id]}")
       redirect_to :root
    else
       @books = @member.bookshelf.books
    end
  end

  def check_out
     bk, member = get_book_and_member
     bsh = member.bookshelf
     bk.borrowed = true
     bsh.books << bk
     save_bookshelf_and_book(bsh, bk)
  end

  def check_in   
     bk, member = get_book_and_user
     bsh = member.bookshelf
     bk.borrowed = false
     bsh.books.delete(bk)
     save_bookshelf_and_book(bsh, bk)
  end

  private
  def save_bookshelf_and_book(book, bookshelf)
     begin
        ActiveRecord::Base.transaction do
           book.save!
           bookshelf.save!
        end
        flash[:notice] = 'Book was successfully borrowed.'
        redirect_to :action => "index"
     rescue ActiveRecord::RecordInvalid,
          ActiveRecord::RecordNotSaved => ex
        redirect_to :controller => :books
     end
  end

  def get_book_and_member
     begin
        [Book.find(params[:id]), Member.find(session[:member_id])]
     rescue ActiveRecord::RecordNotFound
        logger.error("Attempt to access invalid book #{params[:id]} or user #{session[:member_id]}")
        redirect_to_index("Invalid book")
     end
  end
end
