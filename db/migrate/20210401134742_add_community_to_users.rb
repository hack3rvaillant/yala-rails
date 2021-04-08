class AddCommunityToUsers < ActiveRecord::Migration[6.1]
  # def up
  #   add_column :users, :community_id, :integer
  #   add_index  :users, :community_id
  # end

  # def down
  #   remove_index  :users, column: :community_id
  #   remove_column :users, :community_id
  # end

  def change
    add_reference :users, :community, foreign_key: true
  end
end
