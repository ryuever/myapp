class AttachmentsController < ApplicationController

  def index
    # @attachments = Attachment.all
    @user = User.find(params[:user_id])
    @attachments = @user.attachments
#    debugger
  end
  
  def create
    debugger
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
    debugger
    attachment = Attachment.find(params[:id])
    attachment.destroy
    flash[:notice] = "Sucessfully deleted your file"
    redirect_to user_attachments_path
  end
end

