class AddNameAndCodeToCities < ActiveRecord::Migration[6.1]
  def change
    add_column :users_cities, :name, :string
    add_column :users_cities, :country, :string
    remove_column :users_cities, :city_id, :integer
  end
end
