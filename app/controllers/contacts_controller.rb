class ContactsController < ApplicationController
  before_action :find_contact, only: [:edit, :update, :destroy]

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
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      flash[:success] = "Contact updated successfully"
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
    if @contact.destroy
      flash[:success] = "Contact deleted successfully"
      redirect_to contacts_path
    else
      flash[:success] = "Something went wrong"
      redirect_to contacts_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :company, :phone, :email, :address, :group_id, :avatar)
  end

  def find_contact
    @contact = Contact.find_by(id: params[:id])
  end

end
