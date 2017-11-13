class PosInvInvoicesController < ApplicationController
  before_action :authenticate_pos_usr_user!
  before_action :set_pos_inv_invoice, only: [:show, :edit, :update, :destroy]

  # GET /pos_inv_invoices
  # GET /pos_inv_invoices.json
  def index
    @pos_inv_invoices = PosInvInvoice.all
  end

  # GET /pos_inv_invoices/1
  # GET /pos_inv_invoices/1.json
  def show
  end

  # GET /pos_inv_invoices/new


  def new
    @pos_inv_invoice = PosInvInvoice.new
    @pos_inv_invoice_number = PosInvInvoice.where(pos_usr_user_id: current_pos_usr_user.id).last.invoice_num + 1
    @pos_usr_transpoter = PosUsrTranspoter.find_by_pos_usr_user_id(current_pos_usr_user)
    @pos_usr_lorry = PosUsrLorry.where(pos_usr_transpoter_id:@pos_usr_transpoter.id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new
        send_data pdf.render, filename:'members.pdf', type: "application/pdf", disposition:'inline'
      end
    end
  end

  # GET /pos_inv_invoices/1/edit
  def edit
  end

  # POST /pos_inv_invoices
  # POST /pos_inv_invoices.json
  def create
    @pos_inv_invoice = PosInvInvoice.new(pos_inv_invoice_params)

    respond_to do |format|
      if @pos_inv_invoice.save
        format.html { redirect_to @pos_inv_invoice, notice: 'Pos inv invoice was successfully created.' }
        format.json { render :show, status: :created, location: @pos_inv_invoice }
      else
        format.html { render :new }
        format.json { render json: @pos_inv_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pos_inv_invoices/1
  # PATCH/PUT /pos_inv_invoices/1.json
  def update
    respond_to do |format|
      if @pos_inv_invoice.update(pos_inv_invoice_params)
        format.html { redirect_to @pos_inv_invoice, notice: 'Pos inv invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @pos_inv_invoice }
      else
        format.html { render :edit }
        format.json { render json: @pos_inv_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos_inv_invoices/1
  # DELETE /pos_inv_invoices/1.json
  def destroy
    @pos_inv_invoice.destroy
    respond_to do |format|
      format.html { redirect_to pos_inv_invoices_url, notice: 'Pos inv invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category
    @lorry_category = []
    lorry_num = params[:lorry_num]
    @lorry_category << PosUsrLorryCategory.find(PosUsrLorry.find_by_number(lorry_num).pos_usr_lorry_category_id).category
    # Rails.logger.debug("Myzzzz: #{@lorry_category.inspect}")
    respond_to do |format|
      format.html
      format.json {render json: @lorry_category}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pos_inv_invoice
    @pos_inv_invoice = PosInvInvoice.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pos_inv_invoice_params
    params.require(:pos_inv_invoice).permit(:invoice_num, :gatepass_number, :billing_date, :delivery_date, :rate_of_transporter, :customer, :pos_usr_lorry_id,
                                            pos_inv_destination_attributes: [:id, :name], pos_inv_extra_charge_attributes: [:id, :name, :amount])
  end
end
