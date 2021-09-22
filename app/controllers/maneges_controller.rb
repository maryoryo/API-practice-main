class ManegesController < ApplicationController
  before_action :set_manege, only: %i[ show edit update destroy ]

  # GET /maneges or /maneges.json
  def index
    @maneges = Manege.all
  end

  # GET /maneges/1 or /maneges/1.json
  def show
  end

  # GET /maneges/new
  def new
    @manege = Manege.new
  end

  # GET /maneges/1/edit
  def edit
  end

  # POST /maneges or /maneges.json
  def create
    @manege = Manege.new(manege_params)

    respond_to do |format|
      if @manege.save
        format.html { redirect_to @manege, notice: "Manege was successfully created." }
        format.json { render :show, status: :created, location: @manege }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maneges/1 or /maneges/1.json
  def update
    respond_to do |format|
      if @manege.update(manege_params)
        format.html { redirect_to @manege, notice: "Manege was successfully updated." }
        format.json { render :show, status: :ok, location: @manege }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @manege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maneges/1 or /maneges/1.json
  def destroy
    @manege.destroy
    respond_to do |format|
      format.html { redirect_to maneges_url, notice: "Manege was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manege
      @manege = Manege.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manege_params
      params.require(:manege).permit(:name, :post)
    end
end
