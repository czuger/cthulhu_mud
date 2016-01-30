class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  # GET /monsters
  # GET /monsters.json
  def index
    @monsters = Monster.all
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
    @monster.hit_points, @monster.willpower_test, @monster.horror, @monster.combat_test, @monster.damages, @monster.apparition_weight = session[ :last_monster_info ]
    set_places
    check_places
  end

  # GET /monsters/1/edit
  def edit
    set_places
    check_places
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(monster_params)

    @monster.code = @monster.cleaned_default_translation

    session[ :last_monster_info ] = [ @monster.hit_points, @monster.willpower_test, @monster.horror, @monster.combat_test, @monster.damages, @monster.apparition_weight ]

    respond_to do |format|
      if @monster.save
        @monster.place_ids = params[ :places ]
        format.html { redirect_to @monster, notice: 'Monster was successfully created.' }
        format.json { render :show, status: :created, location: @monster }
      else
        format.html { render :new }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.update(monster_params)
        @monster.place_ids = params[ :places ]
        format.html { redirect_to @monster, notice: 'Monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @monster }
      else
        format.html { render :edit }
        format.json { render json: @monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    respond_to do |format|
      format.html { redirect_to monsters_url, notice: 'Monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      @monster = Monster.find(params[:id])
    end

    def check_places
      @checked_places = @monster.places.select( :id ).map{ |e| e.id }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      params.require(:monster).permit(:default_translation, :hit_points, :willpower_test, :horror, :combat_test, :damages, :apparition_weight)
    end

    def set_places
      @places = Place.where( city: false  ).order( 'default_translation' ).map { |p| [ p.full_description_name, p.id ] }
    end

end
