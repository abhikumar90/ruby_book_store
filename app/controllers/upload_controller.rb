class UploadController < ApplicationController
  
  def index
    render :file => 'app\views\upload\uploadfile.rhtml'
  end

  def uploadFile
   if !current_user.blank?
    book = StoreBook.save(params[:dafile], request.remote_ip)
    book.update_attributes(:contenttype => params[:book][:content_type], :description =>params[:books][:description] )
    Grim.reap(params[:dafile].path)
    a = Grim.reap(params[:dafile].path)
    params[:dafile].original_filename
    jpg = a[0].save("#{Rails.root}/public/digital_assets/images/#{params[:dafile].original_filename.gsub(/\s/,'-')}.png")
    `convert #{Rails.root}/public/digital_assets/images/#{params[:dafile].original_filename.gsub(/\s/,'-')}.png -resize 90 #{Rails.root}/public/digital_assets/images/#{params[:dafile].original_filename.gsub(/\s/,'-')}-size90.png`
    redirect_to '/uploadbook'
    flash[:notice] = "File has been uploaded successfully"
   else
     redirect_to '/uploadbook'
     flash[:notice] = "You are not authorized to upload. Please login to continue"
     
   end
  end

end
