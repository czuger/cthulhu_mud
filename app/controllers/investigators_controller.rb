class InvestigatorsController < ApplicationController
  before_action :set_investigator, only: [:show, :edit, :update, :destroy, :investigate_a_place ]
  before_action :set_current_game_board, except: [ :new_name ]

  include InvestigatorsActions::Movement
  include InvestigatorsActions::ClueFinding

  # GET /investigators
  # GET /investigators.json
  def index
    @investigators = Investigator.where( game_board_id: @current_game_board )
    @investigators.each do |investigator|
      investigator.check_travel
    end
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
    @investigator.influence = profession.influence
    @investigator.observation = profession.observation
    @investigator.game_board = @current_game_board

    action = Ga::Waiting.new( location_id: profession.start_place_id )
    action.save!
    @investigator.game_action = action

    respond_to do |format|
      if @investigator.save
        format.html { redirect_to game_board_investigators_path( @current_game_board ), notice: 'Investigator was successfully created.' }
        format.json { render :show, status: :created, location: @investigator }
      else
        format.html { render new_game_board_investigator_path(@current_game_board ) }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investigators/1
  # PATCH/PUT /investigators/1.json
  def update
    respond_to do |format|
      if @investigator.update(investigator_params)
        format.html { redirect_to [ @current_game_board, @investigator ], notice: 'Investigator was successfully updated.' }
        format.json { render :show, status: :ok, location: @investigator }
      else
        format.html { render new_game_board_investigator_path(@current_game_board ) }
        format.json { render json: @investigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investigators/1
  # DELETE /investigators/1.json
  def destroy
    @investigator.destroy
    respond_to do |format|
      format.html { redirect_to [ @current_game_board, @investigator ], notice: 'Investigator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_name
    @gender = params[ :gender ]
    render layout: false
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_investigator
      @investigator = Investigator.find( params[:id] || params[:investigator_id] )
      @investigator.check_travel
    end

    def set_current_game_board
      @current_game_board = GameBoard.find(params[:game_board_id] )
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
