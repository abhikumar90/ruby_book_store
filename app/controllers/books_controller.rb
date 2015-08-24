class BooksController < ApplicationController
  
  def new
  @page_properties = "new"
  end

  def find
    @search = Book.search do
    fulltext params[:search]
  end
    @books = @search.results
  end

  def create
    @contact=Contact.new(books_params)
    if @contact.save
      redirect_to "/contact"
      flash[:notice] = "Contact saved successfully"
    else
      redirect_to '/contact'
     flash[:notice] = "Please fill all the fields"
      
    end
  end

  def about
  @page_properties = "about"
  end

  def books
    @page_properties = "books"
    @books = Book.order("updated_at DESC").paginate(:page => params[:page], :per_page => 7)
  end

  def category
  @page_properties = "category"
  end

  def uploadbook
  @page_properties = "uploadbook"          
  end


  def contact
 @page_properties = "contact"
 
  end

  def check_exist
    if params[:name]
      @book = Book.find_by_title(params[:name])
      if !@book.blank?
        render :json =>  { :data => true}
      end
    end
  end
  
  def download_book
    book = Book.find(params[:id].to_i)
    send_file "#{Rails.root}/public#{book.file}"
  end

  private

  def books_params
    params.require(:books).permit(:id, :name, :email, :phone, :message)
  end

end
