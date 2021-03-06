class TracksController < ApplicationController
  before_action :require_signed_in
  
  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find(params[:id])
    @user = current_user
    render :show
  end

  def new
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
    	flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update_attributes(track_params)
    	redirect_to track_url(@track)
    else
    	flash.now[:errors] = @track.errors.full_messages
    	render :edit
    end

  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :bonus, :lyrics, :name, :ord)
  end

end