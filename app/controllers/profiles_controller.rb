class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  def index
  end

  def show
    if current_member && current_member == @profile.member
      @member = current_member
    else
      flash[:alert] = "Oops. You're not allowed to view that page."
      redirect_to root_path
    end
  end

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

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_number, :member_id, :profile_pic)
  end
end
