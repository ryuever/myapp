class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  attr_accessible :category, :avatar

  # validates_attachment_presence :avatar,
  # :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, 
  # :message => 'file type is not allowed (only jpeg/png/gif images)'

  # validates_attachment :avatar, :presence => true,
  # :content_type => { :content_type => "image/jpg" }, :message => 'faild'

  # validates_attachment :avatar, :presence => true,
  # :content_type => { :content_type => "image/jpg/png" },
  # :size => { :in => 0..10.kilobytes }

#  validate :check_content_type


#  validates_attachment_content_type :avatar,  :content_type => { :content_type => "image/jpg/png" }
  
#  validates_attachment_presence :avatar

#  has_attached_file :avatar, 
                  #   :url  => "/system/pictures/:id/:style_:basename.:extension", 
                  #   :path => ":rails_root/public/system/pdf/:id/:style_:basename.:extension", 
                  # :styles => { :medium => "300x300>", :thumb => "100x100>" } 
# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # def check_content_type
  #   if !['image/jpeg', 'image/gif','image/png'].include?(self.avatar_content_type)
  #     errors.add_to_base("File '#{self.avatar_file_name}' is not a valid image type") # or errors.add
  #   end
  # end

  has_attached_file :avatar, :styles => { :small => "60x60>", :thumb => "60x60>" }

  validates_attachment :avatar, :presence => true, 
  :content_type => { :content_type => "image/jpg" }, 
  :size => { :in => 0..1000.kilobytes }  
end
