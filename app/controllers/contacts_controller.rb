class ContactsController < ApplicationController
  def index
    if params[:group_id].present?
      @contacts = Group.find_by(id: params[:group_id]).contacts.order(created_at: "DESC").page(params[:page])    
    else
      @contacts = Contact.order(created_at: "DESC").page(params[:page])
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Contact created successfully"
      redirect_to contacts_index_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    if @contact.update(contact_params)
      flash[:success] = "Contact updated successfully"
      redirect_to contacts_index_path
    else
      render 'edit'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :phone, :email, :address, :group_id, :avatar)
  end

end
