class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :delete]
  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(params[:song])
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def set_song
    @song = Song.find(params[:id])
  end
end