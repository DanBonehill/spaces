class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    if resource.profile
      root_path
    else
      flash[:danger] = "You dont have a profile, please complete your profile to access the rest of the site."
      new_member_profile_path(current_member)
    end
  end
end
