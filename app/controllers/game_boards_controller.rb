class GameBoardsController < ApplicationController
  before_action :set_game_board, only: [:show, :edit, :update, :destroy, :start_game, :next_turn ]

  include GameBoardSetting::TurnManagement

  # GET /game_boards
  # GET /game_boards.json
  def index
    @game_boards = GameBoard.all
  end

  # GET /game_boards/1
  # GET /game_boards/1.json
  def show
  end

  # GET /game_boards/new
  def new
    @game_board = GameBoard.new
  end

  # GET /game_boards/1/edit
  def edit
  end

  # POST /game_boards
  # POST /game_boards.json
  def create

    @game_board = GameBoard.new(game_board_params)
    @game_board.current_presage= GameBoard::PRESAGES[ 0 ]
    @game_board.next_presage= GameBoard::PRESAGES[ 1 ]
    @game_board.destiny= 15

    respond_to do |format|
      if @game_board.save

        format.html { redirect_to @game_board, notice: 'Game board was successfully created.' }
        format.json { render :show, status: :created, location: @game_board }
      else
        format.html { render :new }
        format.json { render json: @game_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_boards/1
  # PATCH/PUT /game_boards/1.json
  def update
    respond_to do |format|
      if @game_board.update(game_board_params)
        format.html { redirect_to @game_board, notice: 'Game board was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_board }
      else
        format.html { render :edit }
        format.json { render json: @game_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_boards/1
  # DELETE /game_boards/1.json
  def destroy
    @game_board.destroy
    respond_to do |format|
      format.html { redirect_to game_boards_url, notice: 'Game board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start_game
    @game_board.start_game
    redirect_to game_board_investigators_path( @game_board )
  end

  def next_turn
    @game_board.next_turn
    redirect_to game_board_investigators_path( @game_board )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_board
      @game_board = GameBoard.find(params[:id] || params[:game_board_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_board_params
      params[:game_board]
    end

end
