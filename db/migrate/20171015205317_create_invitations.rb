class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :inviter_id
      t.integer :invited_id
      t.references :event, foreign_key: true

      t.timestamps
    end
    add_index :invitations, [:inviter_id, :invited_id]
  end
end
