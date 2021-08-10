class CreateTableUserActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :table_user_activities do |t|
      t.string :action
      t.references :user, index: true, foreign_key: true
      t.integer :updater_id
      t.timestamps
    end
  end
end
