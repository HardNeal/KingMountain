class AddBallToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ball, :floating
  end
end
