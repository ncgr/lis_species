
class ApplicationController < ActionController::Base

  before_filter :check_existing_cas_session, :set_ckfinder_session
  protect_from_forgery

  #
  # I pitty the fool!
  #
  def permission_denied
    flash[:error] = 'Sorry, your account has insufficient privileges for the requested resource.'
    redirect_to :root
  end

  private

  #
  # Determine whether an existing CAS session was created by checking
  # the cookie tgt (ticket generating ticket).
  #
  def check_existing_cas_session
    unless request.cookies["tgt"].blank?
      authenticate_user!
    end
  end

  #
  # Set CKFinder_Role session to user's most privileged role.
  #
  def set_ckfinder_session
    if user_signed_in?
      roles = current_user.roles
      roles.sort_by! { |r| r.id }
      session[:ckfinder_role] = { :value => roles[0].name.downcase }
    end
  end

  #
  # Set the CKEditor tool bar based on role.
  #
  def set_tool_bar
    if (has_role? :superuser)
      @tool_bar = "AdminToolbar"
    else
      @tool_bar = "MemberToolbar"
    end
  end

end
