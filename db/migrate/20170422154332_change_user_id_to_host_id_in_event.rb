class ChangeUser_idToHost_idInEvent < ActiveRecord::Migration[5.0]
  change_table :events do |t|
    t.rename :user_id, :host_id
  end
end
