class Guides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |g|
      g.string :bird
      g.date :date
      g.string :notes
      g.integer :user_id
    end
  end
end
