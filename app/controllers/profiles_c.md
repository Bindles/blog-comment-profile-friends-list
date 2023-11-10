class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    redirect_to edit_profile_path, notice: 'Please create your profile.' if @profile.nil?
  end

  def edit
    @profile = current_user.profile
    redirect_to profile_path, notice: 'Profile already exists.' if @profile.present?
  end

  def update
    @profile = current_user.profile

    if @profile.nil?
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'Profile was successfully created.'
      else
        render :edit
      end
    elsif @profile.update(profile_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :avatar)
  end
end
