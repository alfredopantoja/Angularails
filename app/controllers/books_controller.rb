class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  def index
    @books = Book.all

    respond_to do |format|
      format.html { }
      format.json { render json: @books, root: false, each_serializer: BookSerializer }
    end 
  end

  # GET /books/1
  def show
    respond_to do |format|
      format.html { }
      format.json { render json: @book, root: false }
    end  
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.create(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render json: @book } 
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end  
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    respond_to do |format|
      format.html {
        redirect_to books_url, notice: 'Book was successfully destroyed.'
      }
      format.json { render json: { message: "Book was deleted" } }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :author)
    end
end
