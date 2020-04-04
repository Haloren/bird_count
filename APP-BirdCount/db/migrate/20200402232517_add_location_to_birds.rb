class AddLocationToBirds < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :location, :string
  end
end
