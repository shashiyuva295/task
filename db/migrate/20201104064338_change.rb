class Change < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :subject, :string
  end
end
