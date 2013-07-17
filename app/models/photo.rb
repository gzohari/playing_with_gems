class Photo < ActiveRecord::Base
   attr_accessible :name, :image, :description, :user_id, :remove_image, :image_cache
   mount_uploader :image, ImageUploader
   belongs_to :user

   validates_presence_of :name, :image, :user_id

   after_commit :email_admins, on: :create

   
   def email_admins
     EmailWorker.perform_async(mailer_type: :admin, email_type: :new_upload,
                               photo_id: self.id)
   end
  

end
