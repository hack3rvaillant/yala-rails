class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.string :subdomain
      t.string :name

      t.timestamps
    end
  end
end
