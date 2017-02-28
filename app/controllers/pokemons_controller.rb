require "csv"

class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      if @pokemon.update(pokemon_params)
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
        format.json { render :show, status: :ok, location: @pokemon }
      else
        format.html { render :edit }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
      Pokemon.destroy_all(["id > 0"])
      flash[:notice] = "全件削除しました。"
      redirect_to "/"
  end

  def sendCSV
  end

  def readCSV
      Pokemon.destroy_all
      data = params[:file]
      arr = []
      CSV.foreach(data.path) do |csv|
          poke = Pokemon.new
          poke.number = csv[0]
          poke.name = csv[1]
          poke.type1 = csv[2]
          poke.type2 = csv[3]
          poke.ability1 = csv[4]
          poke.ability2 = csv[5]
          poke.hidden_ability = csv[6]
          poke.hp = csv[7]
          poke.attack = csv[8]
          poke.defence = csv[9]
          poke.sp_attack = csv[10]
          poke.sp_defence = csv[11]
          poke.speed = csv[12]
          poke.total = csv[13]
          poke.save!
          arr.push(poke)
      end
      flash[:notice] = "#{arr.size}件追加しました。"
      redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.require(:pokemon).permit(:number, :name, :type1, :type2, :ability1, :ability2, :hidden_ability, :hp, :attack, :defence, :sp_attack, :sp_defence, :speed, :total)
    end
end
