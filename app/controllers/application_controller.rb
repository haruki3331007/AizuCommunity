class ApplicationController < ActionController::Base
    
    
    def after_sign_in_path_for(resource)
        if user_signed_in?
            stored_location_for(resource) || user_path(current_user.id)
        else
            stored_location_for(resource) || root_path
        end
    end
end
