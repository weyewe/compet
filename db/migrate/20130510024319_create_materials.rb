class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :competence_id 
      t.string :storage_url 
      
      t.string :title 

      t.timestamps
    end
  end
end
