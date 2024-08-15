class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates_integrity_of :image
end
