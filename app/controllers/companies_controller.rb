class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_is_permitted
  before_action :set_company_from_id, only: [:show, :edit, :update, :destroy, :friends,
    :add_friend, :remove_friend]

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.companies.order(:name).page(params[:page]).per(10)
    @companies = @companies.search(params[:s]) unless params[:s].empty? if params[:s]
    @collab_companies = current_user.collab_companies.order(:name).page(params[:page]).per(10)
    @collab_companies = @collab_companies.search(params[:s]) unless params[:s].empty? if params[:s]
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.user = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to companies_url, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_url, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  def friends
  end

  def add_friend
    user = User.where(email: params[:email]).first
    if user
      @company.collaborators << user
      redirect_to :back, notice: "#{user.email} added"
    else
      redirect_to :back, notice: "#{params[:email]} not registered. Plese tell them to register and add them."
    end
  end

  def remove_friend
    user = User.find(params[:collab_id])
    @company.collaborators.delete user
    redirect_to :back, notice: "#{user.email} removed from friends list"
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :description)
    end

    include UserPermissionCheck
end
