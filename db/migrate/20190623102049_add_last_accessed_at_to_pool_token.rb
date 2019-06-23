class AddLastAccessedAtToPoolToken < ActiveRecord::Migration[5.2]
  def change
    add_column :token_pools, :last_access, :datetime
  end
end
