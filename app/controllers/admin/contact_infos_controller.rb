class Admin::ContactInfosController < Admin::Controller
  def edit
    @contact = ContactInfo.find(params[:id])
  end
  
  
  def update
    @contact = ContactInfo.find(params[:id])
    if @contact.update_attributes(params[:contact_info])
      messages(:success) << 'Contact Info was successfully saved.'
      redirect_to edit_admin_contact_info_path(@contact)
    else
      errors_for(@contact, "There was an error saving the contact info:", true)
      render :action => :edit
    end
  end
end