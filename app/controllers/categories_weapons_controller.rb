class CategoriesWeaponsController < ApplicationController
  before_action :set_categories_weapon, only: %i[ show edit update destroy ]

  # GET /categories_weapons or /categories_weapons.json
  def index
    @categories_weapons = CategoriesWeapon.all
  end

  # GET /categories_weapons/1 or /categories_weapons/1.json
  def show
  end

  # GET /categories_weapons/new
  def new
    @categories_weapon = CategoriesWeapon.new
  end

  # GET /categories_weapons/1/edit
  def edit
  end

  # POST /categories_weapons or /categories_weapons.json
  def create
    @categories_weapon = CategoriesWeapon.new(categories_weapon_params)

    respond_to do |format|
      if @categories_weapon.save
        format.html { redirect_to categories_weapon_url(@categories_weapon), notice: "Categories weapon was successfully created." }
        format.json { render :show, status: :created, location: @categories_weapon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categories_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories_weapons/1 or /categories_weapons/1.json
  def update
    respond_to do |format|
      if @categories_weapon.update(categories_weapon_params)
        format.html { redirect_to categories_weapon_url(@categories_weapon), notice: "Categories weapon was successfully updated." }
        format.json { render :show, status: :ok, location: @categories_weapon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categories_weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_weapons/1 or /categories_weapons/1.json
  def destroy
    @categories_weapon.destroy

    respond_to do |format|
      format.html { redirect_to categories_weapons_url, notice: "Categories weapon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categories_weapon
      @categories_weapon = CategoriesWeapon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categories_weapon_params
      params.require(:categories_weapon).permit(:category_id, :weapon_id)
    end
end
