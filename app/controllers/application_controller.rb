class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  set_current_tenant_through_filter
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_configurations
  before_action :set_tenant


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referrer, alert: exception.message
  end

  def set_tenant
    if current_user.present?
      current_store = current_user.store_configuration
      set_current_tenant(current_store)
    end
  end
  private

  ##
  # set_configurations loads the global store configurations.
  def set_configurations
    @configurations = current_user.store_configuration if current_user.present?
  end
end
