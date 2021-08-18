class RoomsController < ApplicationController
  before_action :send_rooms, except: %i[create new index]
  before_action :authenticate_user!, except: %i[show]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: 'Saved ....'
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def show; end

  def listing; end

  def pricing; end

  def description; end

  def photo_upload; end

  def amenities; end

  def location; end

  def update
    if @room.update
      flash[:succes] = 'Room Updated'
    else
      flash[:error] = 'Something Went wrong'
    end
    redirect_back(fallback_location: request.referer)
  end

  private

  def send_rooms
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accomodate, :bed_room, :bath_room, :listing_name, :summary,
                                 :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
  end
end
