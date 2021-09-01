class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params.required(:profile).permit(:name, :age))
    if @profile.save
    redirect_to profiles_path
  else
    render new
  end
end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(params.required(:profile).permit(:name, :age))
      redirect_to profiles_path
    else
      render new
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if @profile.delete
    redirect_to profiles_path
    end
  end
end
