class WeaponsController < ApplicationController
  before_action :set_weapon, only: %i[ show edit update destroy destroy_image ]

  # GET /weapons or /weapons.json
  def index
    @q = Weapon.ransack(params[:q])
    @current_order = current_order
    @weapons = @q.result(distinct: true).priced_above(600).page(params[:page]).per(10)
  end

  # GET /weapons/1 or /weapons/1.json
  def show
  end

  # GET /weapons/new
  def new
    @weapon = Weapon.new
  end

  # GET /weapons/1/edit
  def edit
  end

  # POST /weapons or /weapons.json
  def create
    @weapon = Weapon.new(weapon_params)
    @weapon.image.attach(params[:weapon][:image])

    respond_to do |format|
      if @weapon.save
        format.html { redirect_to weapon_url(@weapon), notice: "Weapon was successfully created." }
        format.json { render :show, status: :created, location: @weapon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weapons/1 or /weapons/1.json
  def update
    respond_to do |format|
      if @weapon.update(weapon_params)
        format.html { redirect_to weapon_url(@weapon), notice: "Weapon was successfully updated." }
        format.json { render :show, status: :ok, location: @weapon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weapon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weapons/1 or /weapons/1.json
  def destroy
    @weapon.destroy
    @weapon.image.purge
    respond_to do |format|
      format.html { redirect_to weapons_url, notice: "Weapon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def destroy_image
    @weapon.image.purge
    @weapon.save!
    redirect_to weapons_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weapon_params
      params.require(:weapon).permit(:name, :description, :price, :image)
    end

end
