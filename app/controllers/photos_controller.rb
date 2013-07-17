class PhotosController < ApplicationController
  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = Photo.new params[:photo]
    if @photo.save
      flash[:notice] = "Created photo, now make more"
      redirect_to user_path current_user
    else
      render :action => 'new'
    end
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def show
    @photo = Photo.find params[:id]
  end


  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Updated painting!"
      redirect_to user_path current_user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Your photo has died"
    redirect_to user_path current_user
  end
end
