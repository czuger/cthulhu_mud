class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy]

  # GET /investigators
  # GET /investigators.json
  def index
    @investigators = Investigator.all
  end

  # GET /investigators/1
  # GET /investigators/1.json
  def show
  end

  # GET /investigators/new
  def new
    @investigator = Investigator.new
    initialize_investigator
  end

  # GET /investigators/1/edit
  def edit
  end

  # POST /investigators
  # POST /investigators.json
  def create
    @investigator = Investigator.new(investigator_params)

    profession = Profession.find( params[ :investigator ][ :profession_id ] )
    @investigator.location_id = profession.start_place_id

    respond_to do |format|
      if @investigator.save
        format.html { redirect_to @investigator, notice: 'Investigator was successfully created.' }
        format.json { render :show, status: :created, location: @investigator }
      else
        format.html { render :new }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigators/1
  # PATCH/PUT /investigators/1.json
  def update
    respond_to do |format|
      if @investigator.update(investigator_params)
        format.html { redirect_to @investigator, notice: 'Investigator was successfully updated.' }
        format.json { render :show, status: :ok, location: @investigator }
      else
        format.html { render :edit }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigators/1
  # DELETE /investigators/1.json
  def destroy
    @investigator.destroy
    respond_to do |format|
      format.html { redirect_to investigators_url, notice: 'Investigator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_name
    @gender = params[ :gender ]
    render layout: false
  end

  def move
    set_investigator
    @travels = Travel.where( place_from_id: @investigator.location_id )
  end

  def move_start
    set_investigator
    travel = Travel.find( params[ :travel_destination ] )
    @investigator.update_attributes(
      location_id: nil, travel_id: travel.id, travel_start_time: Time.now
    )
    redirect_to investigators_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigator
      @investigator = Investigator.find( params[:id] || params[:investigator_id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investigator_params
      params.require(:investigator).permit(:name, :gender, :profession_id)
    end

    def initialize_investigator
      @investigator.gender= :m
      @investigator.name = Investigator.generate_name( :m )
    end
end
