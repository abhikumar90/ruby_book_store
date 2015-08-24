class StoreBook < ActiveRecord::Base
 def self.save(upload, r_ip)
    name =  upload.original_filename
    directory = "#{Rails.root}/public/data/"
    path = File.join(directory, name)
    img = "#{upload.original_filename.split(" ").join("-")}-size90.png"
    File.open(path, "wb") { |f| f.write(upload.read) }
 
    Book.create(title: name, file: "/data/#{name}", uploaddate: Date.today, created_by: r_ip, image: "/digital_assets/images/#{img}")
  end
end
