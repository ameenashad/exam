class AddUserIdToAnswer < ActiveRecord::Migration[5.0]
  def up
    add_column :answers, :user_id, :integer
    add_column :answers, :question_id, :integer
    add_column :questions, :user_id, :integer
    
    
    # remove_column :users, :email, :string
    # rename_column :users, :encrypted_password, :xyz
    # change_column :users, :xyz, :integer

  end

  def down
    remove_column :answers, :user_id, :integer
    remove_column :answers, :question_id, :integer
    remove_column :questions, :user_id, :integer
    # add_column :users, :email, :string
    # rename_column :users, :xyz, :encrypted_password
    # change_column :users, :encrypted_password, :string

    
  end
end
