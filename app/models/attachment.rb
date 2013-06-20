class Attachment < ActiveRecord::Base
  belongs_to :attachable
  attr_accessible :catagory, :file, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
