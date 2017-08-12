class ProfilesController < ApplicationController

  def new
    @profile = current_member.build_profile
  end

  def create
    @profile = current_member.create_profile(profile_params)
    if @profile.save
      flash[:success] = "Your profile was successfully created"
      redirect_to root_path
    else
      flash.now[:danger] = "Something went wrong"
      render :new
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_number, :member_id, :profile_pic)
  end
end
