class CreateComableTenant < ActiveRecord::Migration
  def change
    create_table :comable_tenants do |t|
      t.string :name, null: false, unique: true
      t.string :domain
    end
  end
end
