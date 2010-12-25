class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    remove_column :admin_users, :email
    change_table(:admin_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
    end
    add_index :admin_users, :email,                :unique => true
    add_index :admin_users, :reset_password_token, :unique => true
    # add_index :admin_users, :confirmation_token,   :unique => true
    # add_index :admin_users, :unlock_token,         :unique => true
  end

  def self.down
    remove_index :admin_users, :reset_password_token
    remove_index :admin_users, :email
    remove_column :admin_users, :email
    remove_column :admin_users, :encrypted_password
    remove_column :admin_users, :password_salt
    remove_column :admin_users, :reset_password_token
    remove_column :admin_users, :remember_token
    remove_column :admin_users, :remember_created_at
    remove_column :admin_users, :sign_in_count
    remove_column :admin_users, :current_sign_in_at
    remove_column :admin_users, :last_sign_in_at
    remove_column :admin_users, :current_sign_in_ip
    remove_column :admin_users, :last_sign_in_ip
    add_column :admin_users, 'email', :string, :default => '', :null => false
  end
end
