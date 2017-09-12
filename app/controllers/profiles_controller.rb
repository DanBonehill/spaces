class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]
  before_action :require_same_member, only: [:show, :edit]

  def index
  end

  def show
    @member = current_member
  end

  def new
    @profile = current_member.build_profile
  end

  def edit
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

  def update
    @profile = current_member.profile
    if @profile.update(profile_params)
      flash[:success] = "Your profile was successfully updated"
      redirect_to member_profile_path(@profile)
    else
      flash.now[:danger] = "Something went wrong"
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :contact_number, :member_id, :profile_pic)
  end

  def require_same_member
    if current_member != @profile.member
      flash[:alert] = "Oops. You're not allowed to view that page."
      redirect_to root_path
    end
  end
end
