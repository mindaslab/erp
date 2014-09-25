module UserPermissionCheck
  extend ActiveSupport::Concern

  def set_company
    @company = current_user.get_company params[:company_id]
  end

  def check_user_is_collaborator
    redirect_to root_path, notice: "You are not autorised for this action." unless @company
  end
end