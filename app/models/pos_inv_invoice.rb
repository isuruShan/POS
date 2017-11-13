class PosInvInvoice < ApplicationRecord
  has_many :pos_inv_destinations
  has_many :pos_inv_extra_charges
  has_many :pos_usr_users
end
