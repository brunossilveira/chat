class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)

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

  def room_params
    params.require(:room).permit(:title)
  end
end
