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

  validates_attachment_content_type :avatar,  :content_type => { :content_type => "image/jpg/png" }
  
#  validates_attachment_presence :avatar

  has_attached_file :avatar, 
                    :url  => "/system/pictures/:id/:style_:basename.:extension", 
                    :path => ":rails_root/public/system/pdf/:id/:style_:basename.:extension", 
                  :styles => { :medium => "300x300>", :thumb => "100x100>" } 
# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
