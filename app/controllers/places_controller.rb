class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    @places = Place.all
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
    @parents = Place.all
  end

  # GET /places/1/edit
  def edit
    @parents = Place.all
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    @place.code = @place.cleaned_default_translation

    respond_to do |format|
      if @place.save
        unless params[ :place ][ :parent_id ].empty?
          @parent = Place.find( params[ :place ][ :parent_id ] )
          @parent.children << @place
        end
        format.html { redirect_to places_path, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        unless params[ :place ][ :parent_id ].empty?
          @parent = Place.find( params[ :place ][ :parent_id ] )
          @parent.children << @place
        end
        format.html { redirect_to places_path, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:code, :default_translation, :gender, :city )
    end
end
