class CreateParents < ActiveRecord::Migration[7.0]
  def change
    create_table :parents do |t|
      t.string :parent_name
      t.string :cpf
      t.string :degree_of_kinship
      t.string :email
      t.string :telephone
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
