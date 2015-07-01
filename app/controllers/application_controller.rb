class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  # rescue_from ActiveRecord::RecordNotFound, with: :not_found 
  # rescue_from Exception, with: :not_found
  # rescue_from ActionController::RoutingError, with: :not_found

  # def raise_not_found
  #   raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  # end

  # def not_found
  #   respond_to do |format|
  #     format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
  #     format.xml { head :not_found }
  #     format.any { head :not_found }
  #   end
  # end

  # def error
  #   respond_to do |format|
  #     format.html { render :file => "#{Rails.root}/public/500", :layout => false, :status => :error }
  #     format.xml { head :not_found }
  #     format.any { head :not_found }
  #   end
  # end
  
  protected

  def configure_devise_permitted_parameters
    registration_params = [:full_name, :email, :password, :password_confirmation, :username, :address,
     :tel, :profile_image]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

end

