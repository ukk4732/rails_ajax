class ContactsController < ApplicationController
  def index
    if params[:group_id].present?
      @contacts = Group.find_by(id: params[:group_id]).contacts.page(params[:page])    
    else
      @contacts = Contact.page(params[:page])
    end
  end
end
