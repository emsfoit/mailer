class CreateEmails < ActiveRecord::Migration[6.0]
  def change
    create_table :emails do |t|
      t.string :receivers, array: true
      t.string :subject
      t.string :body
      t.string :state

      t.timestamps
    end
  end
end
