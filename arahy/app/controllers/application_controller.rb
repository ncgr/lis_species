class ApplicationController < ActionController::Base

  before_filter :set_ckfinder_session
  protect_from_forgery

  #
  # Redirect to HTTP after sign out.
  #
  def after_sign_out_path_for(resource_or_scope)
    root_url(:protocol => 'http')
  end

  #
  # I pitty the fool!
  #
  def permission_denied
    flash[:error] = 'Sorry, your account has insufficient privileges for the requested resource.'
    redirect_to :root
  end

  private

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
