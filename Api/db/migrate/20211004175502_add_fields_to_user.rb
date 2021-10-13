class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    # Adding name for user personalization
    add_column :users, :name, :string
    # Adding Tokens for User authentication (H2)
    add_column :users, :authentication_token, :string, limit: 30
    add_index :users, :authentication_token, unique: true
  end
end
