#profiles_controller.rb
class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  # GET /profiles or /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    # if current_user.profile.nil?
    #   puts "nil"
    #   @profile = current_user.build_profile(profile_params)
    #   puts "create, nil"
    #   puts "Current User ID: #{current_user.email}"
    #   puts "Profile User ID: #{@profile.user_id}"
    #   redirect_to edit_profile_path
    # else
    #   puts "not nil"
    #   @profile = current_user.profile
    # end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
    puts @current_user
    puts "Current User ID: #{current_user.email}"
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    puts "RUN CR"
    #@profile = Profile.new(profile_params)
    if current_user.profile.nil?
      @profile = current_user.build_profile(profile_params)
      puts "create, nil"
      puts "Current User ID: #{current_user.email}"
      puts "Profile User ID: #{@profile.user_id}"
    else
    #@profile = current_user.Profile.new(profile_params)
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

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    puts "RUN UP"
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

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile || current_user.build_profile
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio, :avatar)
    end
end
