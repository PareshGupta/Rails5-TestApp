class CreatePerson < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :first_name
    end
  end
end
