class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!,except: [:top]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # configure_permitted_parametersでは、devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されています。
# 今回のケースでは、ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
  
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  
end
