class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[show edit update]

  def show
    # The show action will automatically render the associated view (app/views/profiles/show.html.erb)
  end

  def edit
    # The edit action will automatically render the associated view (app/views/profiles/edit.html.erb)
  end

 # POST /profiles or /profiles.json
  def create
    puts "RUN CR"

    #@profile = Profile.new(profile_params)
    if current_user.profile.nil?
      #TRUE*SELECTS^
      @profile = current_user.build_profile(profile_params)
      @profile.id = current_user.id
      puts "create, nil"
      puts "Current User ID: #{current_user.email}"
      puts "Profile User ID: #{@profile.user_id}"
    else
      #@profile = current_user.Profile.new(profile_params)
      #@profile.id = current_user.id
      puts "Current User ID: #{current_user.email}"
      puts "Profile User ID: #{@profile.user_id}"
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile(id: current_user.id)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :avatar)
  end
end
