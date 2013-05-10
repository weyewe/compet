class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :title
      t.text :description 

      t.timestamps
    end
  end
end
