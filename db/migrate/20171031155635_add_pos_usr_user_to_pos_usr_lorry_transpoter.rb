class AddPosUsrUserToPosUsrLorryTranspoter < ActiveRecord::Migration[5.0]
  def change
    add_reference :pos_usr_transpoters, :pos_usr_user, foreign_key: true
  end
end
