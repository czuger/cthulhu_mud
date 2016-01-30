class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

  # GET /travels
  # GET /travels.json
  def index
    @travels = Travel.all
  end

  # GET /travels/1
  # GET /travels/1.json
  def show
  end

  # GET /travels/new
  def new
    @travel = Travel.new
    @travel.duration = Time.at( 10 ).utc # We need to start from epoch + 10 sec (default duration)
    set_places
    @travel.place_from_id = session[ :last_place_from_id ]
    @travel.place_to_id = session[ :last_place_to_id ]
  end

  # GET /travels/1/edit
  def edit
    set_places
  end

  # POST /travels
  # POST /travels.json
  def create
    @travel = Travel.new(travel_params)

    session[ :last_place_from_id ] = @travel.place_from_id
    session[ :last_place_to_id ] = @travel.place_to_id

    respond_to do |format|
      if @travel.save
        format.html { redirect_to @travel, notice: 'Travel was successfully created.' }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1
  # PATCH/PUT /travels/1.json
  def update
    respond_to do |format|

      if @travel.update(travel_params)
        format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.json
  def destroy
    @travel.destroy
    respond_to do |format|
      format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def wayback
    @travel = Travel.find( params[ :travel_id ] )
    @travel_wayback = @travel.dup
    @travel_wayback.place_from_id = @travel.place_to_id
    @travel_wayback.place_to_id = @travel.place_from_id
    @travel_wayback.save!
    redirect_to @travel_wayback
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_params
      params.require(:travel).permit(:place_from_id, :place_to_id, :cost, :duration)
    end

    def set_places
      @places = Place.where( city: false ).order( 'created_at desc' ).map { |p| [ p.full_description_name, p.id ] }
    end
end
