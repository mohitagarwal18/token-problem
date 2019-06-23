class CreateTokenPools < ActiveRecord::Migration[5.2]
  def change
    create_table :token_pools do |t|
      t.string :token 
      t.boolean :is_locked , default: false
 
      t.timestamps
    end
  end
end
