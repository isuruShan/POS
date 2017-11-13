class PosUsrLorry < ApplicationRecord
  belongs_to :pos_usr_transpoter
  has_one :pos_usr_lorry_owner
  has_one :pos_usr_lorry_category
end
