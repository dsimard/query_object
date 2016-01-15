class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.date :born_on

      t.timestamps null: false
    end
  end
end
