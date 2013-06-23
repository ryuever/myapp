class AttachmentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
  end
  
  def all
    @users = User.all
    @user  = User.find(params[:user_id])
#    @user  = User.find(params[:id]) 
  end

  def index
    # @attachments = Attachment.all
    @user = User.find(params[:user_id])
    @attachments = @user.attachments
  end
  
  def create
    @user = User.find(params[:user_id])
    @attachment = @user.attachments.create(params[:attachment])
    redirect_to user_attachments_path(@user)
  end

  def download
    attachment = Attachment.find(params[:id])
    send_file  attachment.avatar.path,
               :filename => attachment.avatar_file_name,
               :type => attachment.avatar_content_type,
               :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
  end
  
  def destroy
    attachment = Attachment.find(params[:id])
    attachment.destroy
    flash[:notice] = "Sucessfully deleted your file"
    redirect_to user_attachments_path
  end
end

