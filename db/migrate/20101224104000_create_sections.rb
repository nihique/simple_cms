class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string 'name', :limit => 50
      t.integer 'position'
      t.boolean 'visible', :default => true
      t.string 'content_type', :limit => 20 
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
