class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company
  before_action :check_user_is_collaborator
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @contacts = @contacts.search(params[:s]) unless params[:s].empty? if params[:s]
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    @contact.company = @company
    respond_to do |format|
      if @contact.save
        format.html { redirect_to company_contact_path(@company, @contact), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to company_contacts_url }
      format.json { head :no_content }
    end
  end

  def search
    @contacts = @company.contacts.search(params[:s]).limit(5)
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @company.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:company_id, :name, :ph, :email, :address, :city, :zip, :country, :business, :customer, :supplier, :employee)
    end

    include UserPermissionCheck
end
