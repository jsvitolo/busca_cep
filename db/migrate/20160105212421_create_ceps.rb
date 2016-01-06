class CreateCeps < ActiveRecord::Migration[5.0]
  def change
    create_table :ceps do |t|
      t.string :cep
      t.text :endereco
      t.text :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
