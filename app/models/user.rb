class User < ApplicationRecord
    #belongs_to :account
    #has_many :post
    mount_uploader :icon1, ImageUploader
    mount_uploader :icon2, ImageUploader
end
