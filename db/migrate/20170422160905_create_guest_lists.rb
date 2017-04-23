class CreateGuestLists < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_lists do |t|
      t.references :user, as: :attendee, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
