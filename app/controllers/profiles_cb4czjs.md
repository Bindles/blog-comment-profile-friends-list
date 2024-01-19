class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[index show edit update new]



  def new
    

  end

  def index

  end

  def show
    puts "show"
    puts "Profile ID in the URL: #{params[:id]}"
    if params[:id].present?
      puts User.find(params[:id]).email
    end
    # The show action will automatically render the associated view (app/views/profiles/show.html.erb)
  end
  # The edit action will automatically render the associated view (app/views/profiles/edit.html.erb)
  # GET /profiles/:id/edit or /profiles/:username/edit
  def edit
    unless current_user == @profile.user
      redirect_to root_path, alert: "You can only edit your own profile."
    end
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
        format.html { redirect_to profile_url(@profile.first_name), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    unless current_user == @profile.user
      redirect_to root_path, alert: "You can only edit your own profile."
      return
    end
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


  # def set_post
  #     @post = Post.find(params[:id])
  # end

  def set_profile
    if params[:id].present?
      @profile = User.find(params[:id]).profile
    elsif params[:username].present?
      @profile = User.find_by(username: params[:username]).profile
    else
      @profile = current_user.profile || current_user.build_profile
    end
  end


  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :bio, :avatar)
  end
end
