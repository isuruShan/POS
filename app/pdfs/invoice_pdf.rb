class InvoicePdf < Prawn::Document
  def initialize
    super
    text 'this is the invoice pdf'
  end
end