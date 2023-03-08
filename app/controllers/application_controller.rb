class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    @disable_nav = true
  end

  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end

  def before_sign_in_path_for(resource_or_scope)
    @disable_nav = true
  end
end
