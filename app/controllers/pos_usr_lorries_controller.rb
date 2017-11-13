class PosUsrLorriesController < ApplicationController
  before_action :authenticate_pos_usr_user!
  before_action :set_pos_usr_lorry, only: [:show, :edit, :update, :destroy]

  # GET /pos_usr_lorries
  # GET /pos_usr_lorries.json
  def index
    @pos_usr_lorries = PosUsrLorry.all
  end

  # GET /pos_usr_lorries/1
  # GET /pos_usr_lorries/1.json
  def show
  end

  # GET /pos_usr_lorries/new
  def new
    @pos_usr_lorry = PosUsrLorry.new
  end

  # GET /pos_usr_lorries/1/edit
  def edit
  end

  # POST /pos_usr_lorries
  # POST /pos_usr_lorries.json
  def create
    @pos_usr_lorry = PosUsrLorry.new(pos_usr_lorry_params)
    @pos_usr_lorry.pos_usr_transpoter_id = 1
    respond_to do |format|
      if @pos_usr_lorry.save
        format.html { redirect_to @pos_usr_lorry, notice: 'Pos usr lorry was successfully created.' }
        format.json { render :show, status: :created, location: @pos_usr_lorry }
      else
        format.html { render :new }
        format.json { render json: @pos_usr_lorry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pos_usr_lorries/1
  # PATCH/PUT /pos_usr_lorries/1.json
  def update
    respond_to do |format|
      if @pos_usr_lorry.update(pos_usr_lorry_params)
        format.html { redirect_to @pos_usr_lorry, notice: 'Pos usr lorry was successfully updated.' }
        format.json { render :show, status: :ok, location: @pos_usr_lorry }
      else
        format.html { render :edit }
        format.json { render json: @pos_usr_lorry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos_usr_lorries/1
  # DELETE /pos_usr_lorries/1.json
  def destroy
    @pos_usr_lorry.destroy
    respond_to do |format|
      format.html { redirect_to pos_usr_lorries_url, notice: 'Pos usr lorry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pos_usr_lorry
    @pos_usr_lorry = PosUsrLorry.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pos_usr_lorry_params
    params.require(:pos_usr_lorry).permit(:reg_number, :number, :image, :pos_usr_transpoter_id, :pos_usr_lorry_category_id)
  end
end
