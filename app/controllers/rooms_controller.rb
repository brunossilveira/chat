class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create(room_params)

    if @room.save
      flash[:success] = 'Room created!'

      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @room = Room.includes(:messages).find_by_id(params[:id])
    @message = Message.new
  end

  private

  def authenticate_user!
    if !session[:username] || !session[:dialect]
      redirect_to new_session_path
    end
  end

  def room_params
    params.require(:room).permit(:title)
  end
end
