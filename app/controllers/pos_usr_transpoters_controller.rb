class PosUsrTranspotersController < ApplicationController
  before_action :authenticate_pos_usr_user!
  before_action :set_pos_usr_transpoter, only: [:show, :edit, :update, :destroy]

  # GET /pos_usr_transpoters
  # GET /pos_usr_transpoters.json
  def index
    @pos_usr_transpoters = PosUsrTranspoter.all
  end

  # GET /pos_usr_transpoters/1
  # GET /pos_usr_transpoters/1.json
  def show
  end

  # GET /pos_usr_transpoters/new
  def new
    @pos_usr_transpoter = PosUsrTranspoter.new
  end

  # GET /pos_usr_transpoters/1/edit
  def edit
  end

  # POST /pos_usr_transpoters
  # POST /pos_usr_transpoters.json
  def create
    @pos_usr_transpoter = PosUsrTranspoter.new(pos_usr_transpoter_params)

    respond_to do |format|
      if @pos_usr_transpoter.save
        format.html { redirect_to @pos_usr_transpoter, notice: 'Pos usr transpoter was successfully created.' }
        format.json { render :show, status: :created, location: @pos_usr_transpoter }
      else
        format.html { render :new }
        format.json { render json: @pos_usr_transpoter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pos_usr_transpoters/1
  # PATCH/PUT /pos_usr_transpoters/1.json
  def update
    respond_to do |format|
      if @pos_usr_transpoter.update(pos_usr_transpoter_params)
        format.html { redirect_to @pos_usr_transpoter, notice: 'Pos usr transpoter was successfully updated.' }
        format.json { render :show, status: :ok, location: @pos_usr_transpoter }
      else
        format.html { render :edit }
        format.json { render json: @pos_usr_transpoter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos_usr_transpoters/1
  # DELETE /pos_usr_transpoters/1.json
  def destroy
    @pos_usr_transpoter.destroy
    respond_to do |format|
      format.html { redirect_to pos_usr_transpoters_url, notice: 'Pos usr transpoter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pos_usr_transpoter
    @pos_usr_transpoter = PosUsrTranspoter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pos_usr_transpoter_params
    params.require(:pos_usr_transpoter).permit(:name, :owner_name, :address, :email,
                                               :vat_reg_num, :pos_usr_user_id)
  end
end
