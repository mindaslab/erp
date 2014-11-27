module UserPermissionCheck
  extend ActiveSupport::Concern

  ##
  # Sets the company depending on current logged in user
  def set_company
    @company = current_user.get_company params[:company_id]
  end

  def set_company_from_id
    @company = current_user.get_company params[:id]
  end

  ##
  # If user is not permitted rediects to root_path
  def check_user_is_permitted
    unless current_user.permitted?
      redirect_to static_not_permitted_path, notice: "You are not permitted, contact admin"
    end
  end

  ##
  # Check if company is present
  def check_user_is_collaborator
    redirect_to root_path, notice: "You are not autorised for this action." unless @company
  end
end
