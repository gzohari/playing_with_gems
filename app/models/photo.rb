class Photo < ActiveRecord::Base
   attr_accessible :name, :image, :description, :user_id, :remove_image, :image_cache
   mount_uploader :image, ImageUploader

   validates_presence_of :name, :image, :user_id
end
