class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  attr_accessible :category, :avatar
  
  has_attached_file :avatar, 
                    :url  => "/system/pictures/:id/:style_:basename.:extension", 
                    :path => ":rails_root/public/system/pdf/:id/:style_:basename.:extension", 
                  :styles => { :medium => "300x300>", :thumb => "100x100>" } 
# has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
