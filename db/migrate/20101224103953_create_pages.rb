class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string 'name', :limit => 50
      t.string 'permalink', :limit => 150 
      t.integer 'position'
      t.boolean 'visible', :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
